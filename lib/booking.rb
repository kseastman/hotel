require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel
  class Booking
    def initialize(date_range)
      @reservation = reserve_room(date_range) # probably references a method to find an available room
      @cost_estimate = cost_estimate # this may belong in BookingManager, we'll see
    end

    def reserve_room(date_range)
      # method to find available room and push it to @reservation
      # must raise StandardError if an invalid date range is used
    end

    def cost_estimate
      # calculates the estimated total for a reservation
      # does not include the last day of reservation in
      # the calculation
    end
  end
end
