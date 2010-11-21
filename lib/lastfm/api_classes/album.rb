module LastFM
  class Album < APIClass
    unrestricted_methods :get_buy_links, :get_info,  :get_top_tags, :search

    restricted_methods do
      read  :get_tags
      write :add_tags, :remove_tag, :share
    end
  end
end
