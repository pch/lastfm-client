require "spec_helper"

describe LastFM::Auth do
  it "should define unrestricted methods" do
    LastFM::Auth.should respond_to(:get_token)
  end

  it "should define restricted methods" do
    LastFM::Auth.should respond_to(:get_mobile_session, :get_session)
  end
end
