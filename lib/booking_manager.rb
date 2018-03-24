require 'awesome_print'
require 'pry'
require 'time'

require_relative 'booking'
require_relative 'room'
require_relative 'block'
require_relative 'duration'

module Hotel
  class BookingManager
    # should handle the business logic for bookings
    attr_reader :rooms, :reservations, :occupied_rooms
    def initialize
      @rooms = load_rooms
      @reservations = []
      @occupied_rooms = []
      @block_reservations = []
      @available_rooms = nil
    end

    def load_rooms
      rooms = []
      numbers = (1..20).to_a
      numbers.each do |num|
        rooms << Room.new(num)
      end
      return rooms
    end

    def set_booking(start_date, end_date)
      dates = Duration.new(start_date, end_date)
      date_range = dates.period

      if @reservations.length == 0
        open_room = rooms.first
      else
        available_rooms = all_available(date_range)
        open_room = available_rooms.pop
      end

       @reservations << Booking.new(open_room, date_range)
    end

    def reserve_block(start_date, end_date, number_of_rooms: 5)
      dates = Duration.new(start_date, end_date)
      date_range = dates.period

      open_rooms = rooms.take(number_of_rooms)
      block = Block.new(date_range, open_rooms)

      @block_reservations << block
      return block
    end



    def all_available(date_range) #actively using this
      available_rooms = []
      date_range.each do |date|
        rooms_check = get_availability_by_date(date)

        if available_rooms.length == 0
          available_rooms = rooms_check
        else
          temp_rooms = available_rooms & rooms_check
          available_rooms = temp_rooms
        end
      end

      return available_rooms
    end

    def get_bookings_by_date(date)
      bookings = @reservations.find_all do |booking|
        if booking.period.include? date
          @occupied_rooms << booking
        end
      end
      @available_rooms = @rooms - @occupied_rooms
      if @available_rooms.length == 0
        raise StandardError.new("Room is not available for this day: #{date}")
      end
      return bookings
    end

    def get_booking_by_id(id_to_find)
      find_booking = @reservations.find { |booking| booking.id == id_to_find}
      return find_booking
    end

    def get_availability_by_date(date)
      get_bookings_by_date(date)
      potential_rooms = @available_rooms
      open_rooms = []
      potential_rooms.each do |room|

        unless room.reserved_dates.has_key?(date) || room.block_dates.has_key?(date)
          open_rooms << room

        end
      end
      return open_rooms

    end

  end
end
