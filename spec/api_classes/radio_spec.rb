require "spec_helper"

describe LastFM::Radio do
  it "should define allowed methods" do
    LastFM::Radio.allowed_methods.should == [:get_playlist, :tune]
  end
end
