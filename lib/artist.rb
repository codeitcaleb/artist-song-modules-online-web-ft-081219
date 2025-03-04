require 'pry'

class Artist
  extend Memorable::ClassMethods
  extend Findable
  include Memorable::InstanceMethods
  include Paramable

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    # self.class.all << self  # @@artists << self
    super
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
