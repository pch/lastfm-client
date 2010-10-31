module LastFM
  class Event < APIClass
    allowed_methods :attend, :get_attendees, :get_info, :get_shouts, :share, :shout
  end
end
