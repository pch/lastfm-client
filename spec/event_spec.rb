require "spec_helper"

describe LastFM::Event do
  it "should define allowed methods" do
    LastFM::Event.allowed_methods.should == [:attend, :get_attendees, :get_info, :get_shouts, :share, :shout]
  end
end
