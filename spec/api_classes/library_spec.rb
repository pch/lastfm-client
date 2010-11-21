require "spec_helper"

describe LastFM::Library do
  it "should define unrestricted methods" do
    LastFM::Library.should respond_to(:get_albums, :get_artists, :get_tracks)
  end

  it "should define restricted methods" do
    LastFM::Library.should respond_to(:add_album, :add_artist, :add_track)
  end
end
