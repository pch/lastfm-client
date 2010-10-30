require "spec_helper"

describe LastFM::APIClass do
  it "should define allowed methods" do
    LastFM::APIClass.allowed_methods(:foo, :bar, :baz)
    LastFM::APIClass.allowed_methods.should be_an(Array)
  end

  it "should not allow to call an undefined method" do
    cl = LastFM::APIClass.new
    lambda { cl.i_wasnt_defined }.should raise_error(RuntimeError, "Undefined method i_wasnt_defined")
  end

  it "should not allow to call a method with invalid params" do
    cl = LastFM::APIClass.new
    lambda { cl.foo("not a hash") }.should raise_error(ArgumentError, "Params should be a hash")
  end

  it "should respond to allowed methods" do
    LastFM.should_receive(:send_api_request).with("APIClass.foo", {:bar=>:baz}).and_return({})

    cl = LastFM::APIClass.new
    cl.foo(:bar => :baz).should be_a(Hash)
  end
end
