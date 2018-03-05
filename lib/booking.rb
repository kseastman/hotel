require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel


  class Booking
    attr_reader :cost_estimate, :room, :period
    def initialize(open_room, date_range)
      @room = open_room
      @period = reserve_room(date_range)
      @cost_estimate = get_cost_estimate(period) # this may belong in BookingManager, we'll see
    end

    def reserve_room(date_range)
      room.status = :RESERVED
      dates = []
      date1 = date_range.first
      date_range.each_with_object(date1) {|date| dates << date }
      return dates
    end


    def get_cost_estimate(period)
      # calculates the estimated total for a reservation
      # does not include the last day of reservation in
      # the calculation
      length = period.length - 1
      subtotal = room.cost_per_night * length
      return subtotal
    end

  end
end
