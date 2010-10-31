require "spec_helper"

describe LastFM::Library do
  it "should define allowed methods" do
    LastFM::Library.allowed_methods.should == [:add_album, :add_artist, :add_track, :get_albums, :get_artists, :get_tracks]
  end
end
