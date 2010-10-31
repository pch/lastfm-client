module LastFM
  class Track < APIClass
    allowed_methods :add_tags, :ban, :get_buy_links, :get_correction, :get_fingerprint_metadata,
                    :get_info, :get_similar, :get_tags, :get_top_fans, :get_top_tags, :love,
                    :remove_tag, :search, :share, :unban, :unlove
  end
end
