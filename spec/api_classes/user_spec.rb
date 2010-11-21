require "spec_helper"

describe LastFM::User do
  it "should define unrestricted methods" do
    LastFM::User.should respond_to(
      :get_artist_tracks, :get_banned_tracks, :get_events, :get_friends,
      :get_info, :get_loved_tracks, :get_neighbours, :get_new_releases,
      :get_past_events, :get_playlists, :get_recent_tracks, :get_shouts,
      :get_top_albums, :get_top_artists, :get_top_tags, :get_top_tracks,
      :get_weekly_album_chart, :get_weekly_artist_chart, :get_weekly_chart_list,
      :get_weekly_track_chart
    )
  end

  it "should define restricted methods" do
    LastFM::User.should respond_to(:get_recent_stations, :get_recommended_artists, :get_recommended_events, :shout)
  end
end
