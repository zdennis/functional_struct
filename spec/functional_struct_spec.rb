require File.dirname(__FILE__) + '/spec_helper'

describe FunctionalStruct do
  it "behaves like an OpenStruct" do
    o = FunctionalStruct.new(:a => 1, :b => 2, "c" => 3)
    o.a.should == 1
    o.b.should == 2
    o.c.should == 3
  end
  
  it "makes procs callable" do
    o = FunctionalStruct.new(
      :foo => lambda { "foo" },
      :bar => lambda { "bar" })
    o.foo.should == "foo"
    o.bar.should == "bar"
  end
  
  it "makes procs callable with arguments" do
    o = FunctionalStruct.new(:foo => lambda { |a| "foo#{a}" })
    o.foo("d").should == "food"
  end
end