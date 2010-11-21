require "spec_helper"

describe LastFM::Radio do
  it "should define unrestricted methods" do
    LastFM::Radio.should respond_to(:search)
  end
  
  it "should define restricted methods" do
    LastFM::Radio.should respond_to(:get_playlist, :tune)
  end
end
