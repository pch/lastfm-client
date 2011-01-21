module LastFM
  class Track < APIClass
    unrestricted_methods :get_buy_links, :get_correction, :get_fingerprint_metadata, :get_info,
                         :get_similar, :get_top_fans, :get_top_tags, :search

    restricted_methods do
      read  :get_tags
      write :add_tags, :ban, :love, :remove_tag, :scrobble, :share, :unban, :unlove, :update_now_playing
    end
  end
end
