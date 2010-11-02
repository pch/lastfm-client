module LastFM
  class Track < APIClass
    unrestricted_methods :get_buy_links, :get_correction, :get_fingerprint_metadata, :get_info,
                         :get_similar, :get_top_fans, :get_top_tags, :search

    restricted_methods   :add_tags, :ban, :get_tags, :love, :remove_tag, :share, :unban, :unlove
  end
end
