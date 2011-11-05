module LastFM
  class Artist < APIClass
    unrestricted_methods :get_correction, :get_events, :get_images, :get_info, :get_past_events,
                         :get_podcast, :get_shouts, :get_similar, :get_top_albums, :get_top_fans,
                         :get_top_tags, :get_top_tracks, :search

    restricted_methods do
      read  :get_tags
      write :add_tags, :remove_tag, :share, :shout
    end
  end
end
