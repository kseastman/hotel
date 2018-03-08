require_relative 'spec_helper'

describe "Block" do
it "creates a block" do
  # test that it creates a user
  result = Hotel::Block.new
  result.must_be_instance_of Hotel::Block
end

it "can do things" do
  # create as many tests as are needed to make sure
  # that the user can actually navigate the program
end
end
