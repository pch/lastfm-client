require "spec_helper"

describe LastFM::Radio do
  it "should define restricted methods" do
    LastFM::Radio.restricted_methods.should == [:get_playlist, :tune]
  end
end
