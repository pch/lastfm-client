require "spec_helper"

describe LastFM::Auth do
  it "should define unrestricted methods" do
    LastFM::Auth.unrestricted_methods.should == [:get_token]
  end

  it "should define restricted methods" do
    LastFM::Auth.restricted_methods.should == [:get_mobile_session, :get_session]
  end
end
