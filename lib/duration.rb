require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel
  class Duration
    attr_reader :period
    def initialize(start_date, end_date)
      @date_range = date_range(start_date, end_date)
      @period = list
    end

    def date_range(start_date, end_date)
      new_range = (check_date(start_date)...check_date(end_date))
      return new_range
    end

    def list
      dates = []
      @date_range.each {|date| dates << date }
      #add in call to check availability of the room.
      return dates
    end


    private
    def check_date(date)
      unless date.class == Date
        parsed_date = Date.parse(date)
        date = parsed_date
      end
      return date
    end
  end
end
