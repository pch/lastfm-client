require "spec_helper"

describe LastFM::Event do
  it "should define unrestricted methods" do
    LastFM::Event.unrestricted_methods.should == [:get_attendees, :get_info, :get_shouts]
  end

  it "should define restricted methods" do
    LastFM::Event.restricted_methods.should == [:attend, :share, :shout]
  end
end
