require "spec_helper"

describe LastFM::Playlist do
  it "should define unrestricted methods" do
    LastFM::Playlist.should respond_to(:fetch)
  end

  it "should define restricted methods" do
    LastFM::Playlist.should respond_to(:add_track, :create)
  end
end
