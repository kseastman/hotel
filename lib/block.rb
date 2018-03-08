require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel

  class Block
    @@block_count = 0
    def initialize(date_range)
      @id = @@block_count += 1
      @rooms = [] #check availability?
      @period = date_range
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
