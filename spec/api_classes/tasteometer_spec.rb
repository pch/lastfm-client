require "spec_helper"

describe LastFM::Tasteometer do
  it "should define unrestricted methods" do
    LastFM::Tasteometer.unrestricted_methods.should == [:compare]
  end
end
