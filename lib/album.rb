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
    self.name() == album_to_compare.name()
  end

  def self.all
    @@albums.values()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  # def self.search(string)
  #   @@albums.select {|k,v| /#{string}/.match(v.name) }
  # end

  def delete
    @@albums.delete(self.id)
  end

end
