module LastFM
  class Artist < APIClass
    allowed_methods :add_tags, :get_correction, :get_events, :get_images, :get_info,
                    :get_past_events, :get_podcast, :get_shouts, :get_similar, :get_tags,
                    :get_top_albums, :get_top_fans, :get_top_tags, :gettoptracks, :remove_tag,
                    :search, :share, :shout
  end
end