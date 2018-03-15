require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel

  class Block
    @@block_count = 0
    def initialize(date_range, available_rooms)
      @id = @@block_count += 1
      @rooms = reserve_block(date_range, available_rooms)
      @period = date_range
    end

    def set_block_price(price)
      block_price = price
      return block_price
    end

    def reserve_block(date_range, open_rooms, price: 150)
      reserved = Hash[date_range.collect { |date| [date, :BLOCK]}]
      rooms = []
      open_rooms.each do |open_room|
        open_room.block_dates = reserved
        open_room.block_price(price)
        rooms << open_room
      end
      return rooms
    end



    # find {n} rooms that are near eachother and available for those dates
    # requirements:
    #=> date range, no more than 5 rooms at a discounted rate
    #=> only include rooms available for the given date range
    #=> a room in a block is not available or included in another block

    #needs:
    #=> date_range
    #=> availablity_checking
    #=> uniqueness

  end
end
