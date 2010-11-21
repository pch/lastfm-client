require "spec_helper"

describe LastFM::Track do
  it "should define unrestricted methods" do
    LastFM::Track.should respond_to(
      :get_buy_links, :get_correction, :get_fingerprint_metadata, :get_info,
      :get_similar, :get_top_fans, :get_top_tags, :search
    )
  end

  it "should define restricted methods" do
    LastFM::Track.should respond_to(
      :get_tags, :add_tags, :ban, :love, :remove_tag, :scrobble, :share, :unban,
      :unlove, :update_now_playing
    )
  end
end
