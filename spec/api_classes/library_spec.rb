require "spec_helper"

describe LastFM::Library do
  it "should define unrestricted methods" do
    LastFM::Library.unrestricted_methods.should == [:get_albums, :get_artists, :get_tracks]
  end

  it "should define restricted methods" do
    LastFM::Library.restricted_methods.should == [:add_album, :add_artist, :add_track]
  end
end
