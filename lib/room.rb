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

      # remove status as a discrete attribute, use block dates and reserved dates instead
      # @status = :AVAILABLE
      @block_dates = nil
      @reserved_dates = nil

    end

    # def change_status(new_status: :RESERVED)
    #   case new_status
    #   when :RESERVED, :AVAILABLE, :BLOCK, :BLOCK_RESERVED
    #     @status = new_status
    #   else
    #     raise ArgumentError.new("Cannot set status to: #{new_status}")
    #   end
    # end

    def block_price(price)
      @cost_per_night = price
    end

  end
end
