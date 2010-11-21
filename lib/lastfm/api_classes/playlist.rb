module LastFM
  class Playlist < APIClass
    unrestricted_methods :fetch
    
    restricted_methods do 
      write :add_track, :create
    end
  end
end
