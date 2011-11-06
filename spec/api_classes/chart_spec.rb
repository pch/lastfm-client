require "spec_helper"

describe LastFM::Chart do
  it "should define unrestricted methods" do
    LastFM::Chart.should respond_to(:get_hyped_artists, :get_hyped_tracks, :get_loved_tracks, :get_top_artists, :get_top_tags, :get_top_tracks)
  end
end
