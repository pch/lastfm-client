module LastFM
  class Playlist < APIClass
    allowed_methods :add_track, :create, :fetch
  end
end