require_relative 'spec_helper'

describe "Booking" do
  before do
    date1 = Date.today
    date2 = date1 + 4

    @manager = Hotel::BookingManager.new
    @booking = @manager.set_booking(date1.to_s, date2.to_s).first
  end
  describe "Booking#initialize" do
    it "can be created" do
      result = @booking
      result.must_be_kind_of Hotel::Booking
    end
  end

  describe "Booking#reserve_room" do
    # deprecated by later features
    # it "changes the status to :RESERVED" do
    #   result = @booking.room.status
    #   result.must_equal :RESERVED
    # end
  end

  describe "Booking#cost_estimate" do
    # creates a cost estimate total for all nights stayed
    # does not include last night in reservation
    it "creates a cost estimate" do
      result = @booking.cost_estimate
      days = @booking.period.length + 1
      nights = @booking.period.length

      result.must_equal nights * 200
      result.wont_equal days * 200
    end

  end



end
