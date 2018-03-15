require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel

  class Block
    @@block_count = 0

    attr_reader :id, :rooms, :period
    def initialize(date_range, available_rooms)
      @id = @@block_count += 1
      @rooms = reserve_block(date_range, available_rooms)
      @period = date_range
    end

    def reserve_block(date_range, open_rooms, price: 150)
      reserved = Hash[date_range.collect { |date| [date, :BLOCK]}]
      rooms = []
      open_rooms.each do |open_room|
        open_room.check_block_dates(date_range)
        open_room.block_dates.merge!(reserved)
        open_room.block_price(price)
        rooms << open_room
      end
      return rooms
    end

  end
end
