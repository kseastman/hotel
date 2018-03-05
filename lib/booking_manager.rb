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
    attr_reader :rooms, :reservations
    def initialize
      @rooms = load_rooms # method which populates all rooms on creation of the manager
      @reservations = [] # user story, list all reservations
    end

    def load_rooms
      rooms = []
      numbers = (1..20).to_a
      numbers.each do |num|
        rooms << Room.new(num)
      end
      return rooms
    end


    def get_booking(start_date, end_date)
      check_date(start_date)
      check_date(end_date)

      date_range = (Date.parse(start_date)..Date.parse(end_date))

      open_room = rooms.find { |room| room.status == :AVAILABLE }
      @reservations << Booking.new(open_room, date_range)
    end

    #   unless Date.valid_commercial?(start_date.year, start_date.mon, start_date.mday) && Date.valid_commercial?(end_date.year, end_date.mon, end_date.mday)



    private
    def check_date(date)
      parsed_date = Date.parse(date.to_s)
      raise StandardError.new("Invalid reservation date entry: #{date}") if parsed_date.class != Date
      compare = parsed_date <=> Date.today.prev_day
      raise StandardError.new("Invalid reservation date entry: #{date} has already passed.") if compare == -1
      return parsed_date
    end

  end
end
binding.pry
