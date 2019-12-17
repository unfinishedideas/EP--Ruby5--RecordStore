require 'rspec'
require 'album'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil, "Joni Mitchell", "Folk")
      album2 = Album.new("Blue", nil, "Joni Mitchell", "Folk")
      expect(album).to(eq(album2))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz")
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz") # nil added as second argument
      album.save()
      album2 = Album.new("Blue", nil, "Joni Mitchell", "Folk") # nil added as second argument
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz")
      album.save()
      album2 = Album.new("Blue", nil, "Joni Mitchell", "Folk")
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz")
      album.save()
      album2 = Album.new("Blue", nil, "Joni Mitchell", "Folk")
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz")
      album.save()
      album2 = Album.new("Blue", nil, "Joni Mitchell", "Folk")
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('.sort') do
    it("finds an album by id") do
      album2 = Album.new("ZZZ: The Album", nil, "The artist formerly known as AAA", "Folk")
      album2.save()
      album = Album.new("AAA", nil, "ZZZ", "Jazz")
      album.save()
      # Album.all()
      expect(Album.sort('artist')).to(eq(album))
    end
  end

  describe('.sort') do
    it("finds an album by id") do
      album2 = Album.new("ZZZ: The Album", nil, "The artist formerly known as AAA", "Folk")
      album2.save()
      album = Album.new("AAA", nil, "ZZZ", "Jazz")
      album.save()
      # Album.all()
      expect(Album.sort('name')).to(eq(album))
    end
  end

  # describe('.search') do
  #   it("is capable of searching the albums list by name") do
  #     album = Album.new("Giant Steps", nil, "John Coltrane", "Jazz")
  #     album.save()
  #     album2 = Album.new("Led Zeppelin II", nil, "Led Zeppelin", "Rock")
  #     album2.save()
  #     expect(Album.search('Led')).to(eq(album2))
  #   end
  # end

end
