require "spec_helper"

describe LastFM::Album do
  it "should define allowed methods" do
    LastFM::Album.allowed_methods.should == [:add_tags, :get_buy_links, :get_info, :get_tags, :get_top_tags, :remove_tag, :search, :share]
  end

  it "should respond to allowed methods" do
    LastFM.should_receive(:send_api_request).with("album.getinfo", {:bar=>:baz}).and_return({})
    LastFM::Album.get_info(:bar => :baz).should be_a(Hash)
  end
end
