require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel

  class Block
    @@block_count = 0
    def initialize
      @id = @@block_count += 1
      @rooms = [] #check availability?
      @period = []
    end

  end
end
