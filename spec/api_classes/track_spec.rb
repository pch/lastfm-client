require "spec_helper"

describe LastFM::Track do
  it "should define unrestricted methods" do
    LastFM::Track.unrestricted_methods.should == [:get_buy_links, :get_correction, :get_fingerprint_metadata, :get_info, :get_similar, :get_top_fans, :get_top_tags, :search]
  end

  it "should define restricted methods" do
    LastFM::Track.restricted_methods.should == [:add_tags, :ban, :get_tags, :love, :remove_tag, :share, :unban, :unlove]
  end
end
