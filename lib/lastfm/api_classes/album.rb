module LastFM
  class Album < APIClass
    unrestricted_methods :get_buy_links, :get_info,  :get_top_tags, :search
    restricted_methods   :add_tags, :get_tags, :remove_tag, :share
  end
end
