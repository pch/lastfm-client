require "spec_helper"

describe LastFM::Tag do
  it "should define unrestricted methods" do
    LastFM::Tag.unrestricted_methods.should == [:get_similar, :get_top_albums, :get_top_artists, :get_top_tags, :get_top_tracks, :get_weekly_artist_chart, :get_weekly_chart_list, :search]
  end
end
