require "spec_helper"

describe LastFM::Tasteometer do
  it "should define unrestricted methods" do
    LastFM::Tasteometer.should respond_to(:compare)
  end
end
