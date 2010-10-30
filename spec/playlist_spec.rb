require "spec_helper"

describe LastFM::Playlist do
  it "should define allowed methods" do
    LastFM::Playlist.allowed_methods.should == [:add_track, :create, :fetch]
  end
end
