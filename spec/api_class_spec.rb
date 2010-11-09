require "spec_helper"

describe LastFM::APIClass do
  it "should define unrestricted methods" do
    LastFM::APIClass.unrestricted_methods(:foo, :bar, :baz)
    LastFM::APIClass.unrestricted_methods.should be_an(Array)
  end

  it "should not allow to call an undefined method" do
    lambda { LastFM::APIClass.i_wasnt_defined }.should raise_error(NoMethodError)
  end

  it "should not allow to call a method with invalid params" do
    lambda { LastFM::APIClass.foo("not a hash") }.should raise_error(ArgumentError, "Params should be a hash")
  end

  it "should respond to unrestricted methods" do
    LastFM.should_receive(:send_api_request).with("apiclass.foo", {:bar => :baz}).and_return({})
    LastFM::APIClass.foo(:bar => :baz).should be_a(Hash)
  end

  it "should define restricted methods" do
    LastFM::APIClass.restricted_methods(:foo1, :bar1, :baz1)
    LastFM::APIClass.should respond_to(:foo1)
    LastFM::APIClass.should respond_to(:bar1)
    LastFM::APIClass.should respond_to(:baz1)
  end

  it "should respond to restricted methods" do
    LastFM.should_receive(:send_api_request).with("apiclass.foo1", {:bar => :baz, :api_sig => true}).and_return({})
    LastFM::APIClass.foo1(:bar => :baz).should be_a(Hash)
  end
end
