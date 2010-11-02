require "spec_helper"

describe LastFM::Playlist do
  it "should define unrestricted methods" do
    LastFM::Playlist.unrestricted_methods.should == [:fetch]
  end

  it "should define restricted methods" do
    LastFM::Playlist.restricted_methods.should == [:add_track, :create]
  end
end
