require_relative 'spec_helper'

describe "Booking" do
  before do
    @date1 = Date.today
    @date2 = @date1 + 4

    @manager = Hotel::BookingManager.new
    @booking = @manager.set_booking(@date1.to_s, @date2.to_s).first
  end
  describe "Booking#initialize" do
    it "can be created" do
      result = @booking
      result.must_be_kind_of Hotel::Booking
    end
  end

  describe "Booking#cost_estimate" do
    it "creates a cost estimate" do
      result = @booking.cost_estimate
      days = @booking.period.length + 1
      nights = @booking.period.length

      result.must_equal nights * 200
      result.wont_equal days * 200
    end

    describe "Booking#reserve_room" do
      it "reserves a room" do

      end

      it "raises an error if there are no available rooms" do
        proc{
          30.times do
            @manager.set_booking(@date1.to_s, @date2.to_s)
          end
        }.must_raise StandardError
      end
    end
  end



end
