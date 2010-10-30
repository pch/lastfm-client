module LastFM
  class Library < APIClass
    allowed_methods :add_album, :add_artist, :add_track, :get_albums, :get_artists, :get_tracks
  end
end
