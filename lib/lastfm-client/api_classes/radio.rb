module LastFM
  class Radio < APIClass
    unrestricted_methods :search
    
    restricted_methods do
      read  :get_playlist
      write :tune
    end
  end
end
