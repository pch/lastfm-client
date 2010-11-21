require "spec_helper"

describe LastFM::Venue do
  it "should define unrestricted methods" do
    LastFM::Venue.should respond_to(:get_events, :get_past_events, :search)
  end
end
