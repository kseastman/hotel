require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel


  class Booking
    @@id_count = 0
    attr_reader :cost_estimate, :room, :period, :id, :id_count
    def initialize(open_room, date_range)
      @id = @@id_count += 1
      @room = open_room
      @period = date_range
      @cost_estimate = get_cost_estimate(period)
    end

    def reserve_room(date_range)
     # add dates to room
     # set status for dates to available

    end

    def get_cost_estimate(period)
      length = period.length
      subtotal = room.cost_per_night * length
      return subtotal
    end
  end
end
