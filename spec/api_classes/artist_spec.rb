require "spec_helper"

describe LastFM::Artist do
  it "should define unrestricted methods" do
    LastFM::Artist.should respond_to(
      :get_correction, :get_events, :get_images, :get_info, :get_past_events,
      :get_podcast, :get_shouts, :get_similar, :get_top_albums, :get_top_fans,
      :get_top_tags, :get_top_tracks, :search
    )
  end
  
  it "should define restricted methods" do
    LastFM::Artist.should respond_to(:add_tags, :get_tags, :remove_tag, :share, :shout)
  end
end
