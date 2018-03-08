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

      #(does this logic belong to room?)
      open_room = rooms.find { |room| room.status == :AVAILABLE }
      @reservations << Booking.new(open_room, date_range)

    end

    def get_bookings_by_date(date)
      bookings = @reservations.find_all do |booking|
        booking.period.include? date
      end
      return bookings
    end

    def get_booking_by_id(id_to_find)
      find_booking = @reservations.find { |booking| booking.id == id_to_find}
      return find_booking
    end

    def get_availability_by_date(date)
      unavailable_rooms = []
      find_bookings = get_bookings_by_date(date)
      find_bookings.each do |booking|
        unavailable_rooms << booking.room
      end

      available_rooms = @rooms - unavailable_rooms
      return available_rooms
    end

    # def set_availability
    #   #unneccesary function, may reuse some logic elsewhere
    #   today = Date.today
    #   @occupied_rooms = get_bookings_by_date(today)
    #   @occupied_rooms.each do |booking|
    #     booking.room.change_status
    #   end
    # end

    def reserve_block(start_date, end_date)
      block_dates = Duration.new(start_date, end_date)
      block = Block.new(block_dates)

      @block_reservations << block
    end

    def check_out(room_number)
      find_room = @rooms.find { |room| room.room_number == room_number}
      find_room.change_status(:AVAILABLE)
    end


  end
end
