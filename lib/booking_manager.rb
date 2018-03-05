require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel
  class BookingManager
    # should handle the business logic for bookings
    # e.g. all methods related to tracking room availability
    # and blocks and costs
    def initialize
      @rooms = # method which populates all rooms on creation of the manager
      @reservations = [] # user story, list all reservations
    end

  end
end
