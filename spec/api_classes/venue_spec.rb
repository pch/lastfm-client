require "spec_helper"

describe LastFM::Venue do
  it "should define unrestricted methods" do
    LastFM::Venue.unrestricted_methods.should == [:get_events, :get_past_events, :search]
  end
end
