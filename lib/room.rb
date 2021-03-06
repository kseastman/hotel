require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel
  class Room
    attr_accessor :reserved_dates, :block_dates
    attr_reader :room_number, :cost_per_night
    def initialize(number)

      # rooms that know their room number and cost
      # make more sense as objects than a hash, for future
      # proofing reasons, maybe overcomplicating things

      @room_number = number
      @cost_per_night = 200
      @block_dates = {}
      @reserved_dates = {}

    end

    def block_price(price)
      @cost_per_night = price
    end

    def check_block_dates(date_range)
      date_range.each do |date|
        if @block_dates.has_key?(date)
          raise StandardError.new("Room is reserved to a block on #{date}")
        end
      end
    end

    def check_reserved_dates(date_range)
      date_range.each do |date|
        if @reserved_dates.has_key?(date)
          raise StandardError.new("Room is already reserved on #{date}")
        end
      end
    end

    def free?(date)
      if @block_dates.has_key?(date) || @reserved_dates.has_key?(date)
        return true
      end
      return false
    end

  end
end
