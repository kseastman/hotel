require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

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

  end
end
