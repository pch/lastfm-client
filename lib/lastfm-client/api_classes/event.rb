module LastFM
  class Event < APIClass
    unrestricted_methods :get_attendees, :get_info, :get_shouts
    
    restricted_methods do
      write :attend, :share, :shout
    end
  end
end
