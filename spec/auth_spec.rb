require "spec_helper"

describe LastFM::Auth do
  it "should define allowed methods" do
    LastFM::Auth.allowed_methods.should == [:get_mobile_session, :get_session, :get_token]
  end
end
