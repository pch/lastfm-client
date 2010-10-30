module LastFM
  class Group < APIClass
    allowed_methods :get_hype, :get_members, :get_weekly_album_chart, :get_weekly_artist_chart,
                    :get_weekly_chart_list, :get_weekly_trackchart
  end
end