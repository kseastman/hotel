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
    result.last.room_number.must_equal 20

  end

  it "has a list of reservations" do

    result = @result.reservations
    result.must_be_kind_of Array

  end

  it "raises an error if an invalid date is used" do
    #this test doesn't seem to pass for the right reasons, investigate further
    today = Date.today
    start_date = "frog"
    proc{ @result.reserve_room(start_date, today)}.must_raise StandardError
  end

  it "raises an error if the first day of the reservation is before the current day" do
    #this test doesn't seem to pass for the right reasons, investigate further
    today = Date.today
    start_date = today << 1
    proc{ @result.reserve_room(start_date, today)}.must_raise StandardError
  end

  it "has business logic" do
    # add as many tests as you need to test the business logic

  end
end
