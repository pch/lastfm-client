require "spec_helper"

describe LastFM::Venue do
  it "should define allowed methods" do
    LastFM::Venue.allowed_methods.should == [:get_events, :get_past_events, :search]
  end
end
