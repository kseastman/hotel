require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel
  class Room
    attr_accessor :status
    attr_reader :room_number, :cost_per_night
    def initialize(number)

      # rooms that know their room number and cost
      # make more sense as objects than a hash, for future
      # proofing reasons, maybe overcomplicating things
      @room_number = number
      @cost_per_night = 200
      @status = :AVAILABLE
      @block_dates = nil

    end

    def change_status(new_status: :RESERVED)
      case new_status
      when :RESERVED, :AVAILABLE, :BLOCK, :BLOCK_RESERVED
        @status = new_status
      else
        raise ArgumentError.new("Cannot set status to: #{new_status}")
      end
    end

  end
end
