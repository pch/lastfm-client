module LastFM
  class Venue < APIClass
    unrestricted_methods :get_events, :get_past_events, :search
  end
end
