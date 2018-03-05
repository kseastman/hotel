require_relative 'spec_helper'

describe "User" do
it "creates a user" do
  # test that it creates a user
  result = Hotel::User.new
  result.must_be_instance_of Hotel::User
end

it "can do things" do
  # create as many tests as are needed to make sure
  # that the user can actually navigate the program
end
end
