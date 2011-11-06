module LastFM
  class Album < APIClass
    unrestricted_methods :get_buy_links, :get_info, :get_shouts, :get_tags, :get_top_tags, :search

    restricted_methods do
      write :add_tags, :remove_tag, :share
    end
  end
end
