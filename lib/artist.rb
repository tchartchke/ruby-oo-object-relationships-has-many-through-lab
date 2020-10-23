class Artist
  attr_accessor :name
  @@all = []

  def initialize(name)
    self.name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def new_song(song, genre)
    Song.new(song, self, genre)
  end

  def songs
    Song.all.select { |song| song.artist == self}
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end
end