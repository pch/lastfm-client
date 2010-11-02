module LastFM
  class Event < APIClass
    unrestricted_methods :get_attendees, :get_info, :get_shouts
    restricted_methods   :attend, :share, :shout
  end
end
