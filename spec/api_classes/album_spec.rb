require "spec_helper"

describe LastFM::Album do
  it "should define unrestricted methods" do
    LastFM::Album.should respond_to(:get_buy_links, :get_info,  :get_top_tags, :search)
  end

  it "should respond to unrestricted methods" do
    LastFM.should_receive(:send_api_request).with("album.getinfo", {:bar => :baz}, :get).and_return({})
    LastFM::Album.get_info(:bar => :baz).should be_a(Hash)
  end

  describe "restricted methods" do
    it "should respond to restricted read methods" do
      LastFM.should_receive(:send_api_request).with("album.gettags", {:bar => :baz, :api_sig => true}, :get).and_return({})
      LastFM::Album.get_tags(:bar => :baz).should be_a(Hash)
    end

    it "should respond to restricted write methods" do
      LastFM.should_receive(:send_api_request).with("album.addtags", {:bar => :baz, :api_sig => true}, :post).and_return({})
      LastFM::Album.add_tags(:bar => :baz).should be_a(Hash)
    end
  end
end
