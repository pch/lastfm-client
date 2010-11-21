require "spec_helper"

describe LastFM::Event do
  it "should define unrestricted methods" do
    LastFM::Event.should respond_to(:get_attendees, :get_info, :get_shouts)
  end

  it "should define restricted methods" do
    LastFM::Event.should respond_to(:attend, :share, :shout)
  end
end
