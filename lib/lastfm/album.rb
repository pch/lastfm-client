module LastFM
  class Album < APIClass
    allowed_methods :add_tags, :get_buy_links, :get_info, :get_tags, :get_top_tags,
                    :remove_tag, :search, :share
  end
end
