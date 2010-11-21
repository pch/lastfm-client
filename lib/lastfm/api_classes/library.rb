module LastFM
  class Library < APIClass
    unrestricted_methods :get_albums, :get_artists, :get_tracks
    
    restricted_methods do 
      write :add_album, :add_artist, :add_track
    end
  end
end
