require "spec_helper"

describe LastFM::Album do
  it "should define unrestricted methods" do
    LastFM::Album.unrestricted_methods.should == [:get_buy_links, :get_info,  :get_top_tags, :search]
  end

  it "should respond to unrestricted methods" do
    LastFM.should_receive(:send_api_request).with("album.getinfo", {:bar => :baz}).and_return({})
    LastFM::Album.get_info(:bar => :baz).should be_a(Hash)
  end

  it "should define restricted methods" do
    LastFM::Album.restricted_methods.should == [:add_tags, :get_tags, :remove_tag, :share]
  end

  it "should respond to restricted methods" do
    LastFM.should_receive(:send_api_request).with("album.gettags", {:bar => :baz, :api_sig=>true}).and_return({})
    LastFM::Album.get_tags(:bar => :baz).should be_a(Hash)
  end
end
