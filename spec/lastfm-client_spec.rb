require "spec_helper"

describe LastFM do
  it "should have a default API URL" do
    LastFM.api_url.should == LastFM::DEFAULT_API_URL
  end

  it "should allow to set a custom API URL" do
    custom_url = "http://foobar.com"

    LastFM.api_url = custom_url
    LastFM.api_url.should == custom_url
  end

  it "should set API key" do
    LastFM.api_key = "1234"
    LastFM.api_key.should == "1234"
  end

  it "should raise error when trying to read empty token" do
    LastFM.api_key = nil
    lambda { LastFM.api_key }.should raise_error(RuntimeError, "API Key is not set")
  end

  it "should set secret" do
    LastFM.secret = "123456"
    LastFM.secret.should == "123456"
  end

  it "should raise error when trying to read empty secret" do
    LastFM.secret = nil
    lambda { LastFM.secret }.should raise_error(RuntimeError, "Secret is not set")
  end

  it "should set client name" do
    LastFM.client_name = "Foobar"
    LastFM.client_name.should == "Foobar"
  end

  it "should raise error when trying to read empty client name" do
    LastFM.client_name = nil
    lambda { LastFM.client_name }.should raise_error(RuntimeError, "Client name is not set")
  end

  it "should have a default Auth URL" do
    LastFM.api_key = "1234"
    LastFM.auth_url.should == LastFM::DEFAULT_AUTH_URL + "?api_key=1234"
  end

  it "should allow to set a custom Auth URL" do
    custom_url = "http://foobarbaz.com"

    LastFM.auth_url = custom_url
    LastFM.auth_url.should == custom_url + "?api_key=1234"
  end

  describe "API requests" do
    it "should raise error when trying to supply invalid params" do
      lambda { LastFM.send_api_request("test", nil) }.should raise_error(RuntimeError, "Invalid params")
    end

    it "should generate key signature" do
      LastFM.secret = "test"
      signature = LastFM.generate_signature(:foo => "hey", :bar => "hi", :baz => "hello")
      signature.should == "46bfc3df86f175c869101e1c8c171589"
    end

    it "should send request" do
      LastFM.api_url     = LastFM::DEFAULT_API_URL
      LastFM.api_key     = "7fbc71d4b818dc1277e273ac1ef92b07"
      LastFM.client_name = "Last.fm Ruby gem"

      LastFM.should_receive(:fetch_data).with("http://ws.audioscrobbler.com/2.0/?artist=Cher&album=Believe&method=album.getinfo&api_key=7fbc71d4b818dc1277e273ac1ef92b07&format=json").and_return({})

      response = LastFM.send_api_request("album.getinfo", :artist => "Cher", :album => "Believe")
      response.should be_a(Hash)
    end

    it "should send GET request by default" do
      LastFM.should_receive(:fetch_data).with("http://ws.audioscrobbler.com/2.0/?artist=Cher&album=Believe&method=album.getinfo&api_key=7fbc71d4b818dc1277e273ac1ef92b07&format=json").and_return({})

      response = LastFM.send_api_request("album.getinfo", :artist => "Cher", :album => "Believe")
      response.should be_a(Hash)
    end

    it "should send request with key signature" do
      LastFM.secret = "test"
      LastFM.should_receive(:fetch_data).with("http://ws.audioscrobbler.com/2.0/?artist=Cher&album=Believe&method=album.getinfo&api_key=7fbc71d4b818dc1277e273ac1ef92b07&api_sig=b796a3385c59872367f31fc510a4ee21&format=json").and_return({})

      response = LastFM.send_api_request("album.getinfo", :artist => "Cher", :album => "Believe", :api_sig => true)
      response.should be_a(Hash)
    end

    it "should send POST requests" do
      LastFM.should_receive(:post_data).with("http://ws.audioscrobbler.com/2.0/", {:user => "jeff", :message => "hi Jeff!", :method => "user.shout", :api_key => "7fbc71d4b818dc1277e273ac1ef92b07", :api_sig => "83c66301079de9f515be5e0206ddbb18", :format => "json"}).and_return({})

      response = LastFM.send_api_request("user.shout", {:user => "jeff", :message => "hi Jeff!", :api_sig => true}, :post)
      response.should be_a(Hash)
    end
  end
end