require_relative 'spec_helper'

describe "BookingManager" do
  before do
    @result = Hotel::BookingManager.new
  end
  it "can be created" do
    @result.must_be_instance_of Hotel::BookingManager
  end

  it "has a list of rooms" do
    result = @result.rooms

    result.must_be_kind_of Array
    result.length.must_equal 20

  end

  it "has a list of reservations" do

    result = @result.reservations

    result.must_be_kind_of Array

  end

  it "has business logic" do
    # add as many tests as you need to test the business logic

  end
end
