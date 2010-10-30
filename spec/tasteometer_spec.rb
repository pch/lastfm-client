require "spec_helper"

describe LastFM::Tasteometer do
  it "should define allowed methods" do
    LastFM::Tasteometer.allowed_methods.should == [:compare]
  end
end
