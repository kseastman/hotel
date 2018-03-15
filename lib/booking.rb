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
      @room = reserve_room(open_room, date_range)
      @period = date_range
      @cost_estimate = get_cost_estimate(date_range)
    end

    def get_cost_estimate(period)
      length = period.size
      subtotal = room.cost_per_night * length
      return subtotal
    end

    def reserve_room(open_room, date_range)
      reserved = Hash[date_range.collect { |date| [date, :RESERVED]}]
      open_room.reserved_dates.merge!(reserved)
      return open_room
    end

  end
end
