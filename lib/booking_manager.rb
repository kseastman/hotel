require 'awesome_print'
require 'pry'
require 'time'

require_relative 'booking'
require_relative 'room'

module Hotel
  class BookingManager
    # should handle the business logic for bookings
    # e.g. all methods related to tracking room availability
    # and blocks and costs
    attr_reader :rooms, :reservations, :occupied_rooms
    def initialize
      @rooms = load_rooms # method which populates all rooms on creation of the manager
      @reservations = [] # user story, list all reservations
      @occupied_rooms = []
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
      check_date(start_date)
      check_date(end_date)

      date_range = (Date.parse(start_date)..Date.parse(end_date))

      open_room = rooms.find { |room| room.status == :AVAILABLE }
      if open_room == nil
        raise StandardError.new("There are no available rooms")
      else
        @reservations << Booking.new(open_room, date_range)
      end
    end

    def get_bookings_by_date(date)
      unless date.class == Date
        parsed_date = check_date(date)
        date = parsed_date
      end
      bookings = @reservations.find_all { |booking| booking.period.include? date}
      occupied_rooms = Hash[bookings.map { |booking| [booking.room.room_number, booking.room]}]
      @occupied_rooms << occupied_rooms
      return bookings
    end

    def get_booking_by_id(id_to_find)
      find_booking = @reservations.find { |booking| booking.id == id_to_find}
      return find_booking
    end

    def get_availability_by_date(date)
      check_date(date)
      find_bookings = @reservations.find_all { |booking| booking.period.include? date}
      return find_bookings
    end

    def set_availability
      today = Date.today
      get_bookings_by_date(today)
      occupied_rooms[0].each_value do |room|
        room.change_status
      end
    end

    def check_out(room_number)
      find_room = @rooms.find { |room| room.room_number == room_number}
      find_room.change_status(:AVAILABLE)
    end

    #   unless Date.valid_commercial?(start_date.year, start_date.mon, start_date.mday) && Date.valid_commercial?(end_date.year, end_date.mon, end_date.mday)

    private
    def check_date(date)
      unless date.class == Date
        parsed_date = Date.parse(date.to_s)
        date = parsed_date
      end
      raise StandardError.new("Invalid reservation date entry: #{date}") if date.class != Date
      compare = date <=> Date.today.prev_day
      raise StandardError.new("Invalid reservation date entry: #{date} has already passed.") if compare == -1
      return date
    end
  end
end
