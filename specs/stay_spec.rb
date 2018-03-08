require_relative 'spec_helper'

describe "Stay" do
it "can be created" do
  # test that it creates a user
  result = Hotel::Stay.new("apr4, 2018", "apr7, 2018")
  result.must_be_instance_of Hotel::Stay
end

it "can do things" do
  # create as many tests as are needed to make sure
  # that the user can actually navigate the program
end
end
