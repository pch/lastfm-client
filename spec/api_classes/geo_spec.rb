require "spec_helper"

describe LastFM::Geo do
  it "should define unrestricted methods" do
    LastFM::Geo.unrestricted_methods.should == [:get_events, :get_metro_artist_chart, :get_metro_hype_artist_chart, :get_metro_hype_track_chart, :get_metro_track_chart, :get_metro_unique_artist_chart, :get_metro_unique_track_chart, :get_metro_weekly_chartlist, :get_metros, :get_top_artists, :get_top_tracks]
  end
end
