require_relative 'spec_helper'

describe "Block" do
before do
 dates = Hotel::Stay.new("apr4, 2018", "apr7, 2018")
 @block1 = Hotel::Block.new(dates)
end
it "creates a block" do
  # test that it creates a user
  result = @block1
  result.must_be_instance_of Hotel::Block
end

it "can do things" do
  # create as many tests as are needed to make sure
  # that the user can actually navigate the program
end
end
