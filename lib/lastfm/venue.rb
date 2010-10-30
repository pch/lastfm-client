module LastFM
  class Venue < APIClass
    allowed_methods :get_events, :get_past_events, :search
  end
end
