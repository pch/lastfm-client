module LastFM
  class Playlist < APIClass
    unrestricted_methods :fetch
    restricted_methods   :add_track, :create
  end
end
