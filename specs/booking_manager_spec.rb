require_relative 'spec_helper'

describe "BookingManager" do
  before do
    date1 = Date.today
    date2 = date1 + 3

    @date = date2
    @result = Hotel::BookingManager.new
    @booking1 = @result.set_booking(date1.to_s, date2.to_s)
    @booking2 = @result.set_booking((date1 + 1).to_s, date2.to_s)
  end
  describe "Initialize" do
    it "can be created" do
      @result.must_be_instance_of Hotel::BookingManager
    end

    it "creates a list of rooms" do
      result = @result.rooms

      result.must_be_kind_of Array
      result.length.must_equal 20
      result.last.room_number.must_equal 20

    end
  end

  describe "BookingManager - Business Logic" do
    describe "Reservation Handling" do
      it "has a list of reservations" do

        result = @result.reservations
        result.must_be_kind_of Array
        result.length.must_equal 2

      end

      it "can find a list of reservations by date" do
        date = Date.today + 2
        result = @result.get_bookings_by_date(date)

        result.must_be_kind_of Array
        result[0].must_be_instance_of Hotel::Booking
        result[0].period.must_include date

      end

      it "can find a reservation by id" do
        id_to_find = @result.reservations[0].id
        result = @result.get_booking_by_id(id_to_find)

        result.must_be_instance_of Hotel::Booking
        result.id.must_equal id_to_find
      end

      it "can handle :AVAILABLE/:UNAVAILABLE reservation logic" do
        proc{ 20.times do
          @result.set_booking(date1.to_s, date2.to_s)
        end}.must_raise StandardError
      end

      it "can get a list of available rooms by date" do
        result = @result.get_availability_by_date(@date)
        result.must_be_kind_of Array
        #---

        result = @result.get_availability_by_date(@date).first
        result2 = result.reserved_dates.include?(@date)

        result.must_be_instance_of Hotel::Room
        result2.must_equal false

      end
    end

    describe "Date Handling" do

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

    end
  end
end
