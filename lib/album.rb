class Album
  attr_reader :id, :name, :artist, :genre  #Our new save method will need reader methods.

  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an ALbum is added.

  def initialize(name, id, artist, genre) # We've added id as a second parameter.
    @name = name
    @id = id || @@total_rows += 1  # We've added code to handle the id.
    @artist = artist
    @genre = genre
  end

  def update(name)
    @name = name
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.id, self.artist, self.genre)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name() && self.artist() == album_to_compare.artist() && self.genre() == album_to_compare.genre()
  end

  # def ==(other_album)
  #   self.name.eql?(other_album.name) && self.artist.eql?(other_album.artist) && self.genre.eql?(other_album.genre) && self.genre.eql?(other_album.genre)
  # end

  def self.all
    @@albums.values()
  end

  def self.all2
    return @@albums
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def self.search(string)
    @@albums.values().select {|e| /#{string}/i.match(e.name) }
  end

  def self.sort(input)
    # @@albums.sort_by {|e| input.match(e.name) }
    if input == 'artist'
      @@albums.values().sort{ |a, b| a.artist <=> b.artist }
    elsif input == 'name'
      @@albums.values().sort{ |a, b| a.name <=> b.name }
    end
  end

  def delete
    @@albums.delete(self.id)
  end

end
