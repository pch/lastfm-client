module LastFM
  class User < APIClass
    unrestricted_methods :get_artist_tracks, :get_banned_tracks, :get_events, :get_friends,
                         :get_info, :get_loved_tracks, :get_neighbours, :get_new_releases,
                         :get_past_events, :get_playlists, :get_recent_tracks, :get_shouts,
                         :get_top_albums, :get_top_artists, :get_top_tags, :get_top_tracks,
                         :get_weekly_album_chart, :get_weekly_artist_chart, :get_weekly_chart_list,
                         :get_weekly_track_chart

    restricted_methods do
      read  :get_recent_stations, :get_recommended_artists, :get_recommended_events
      write :shout
    end
  end
end
