require 'awesome_print'
require 'pry'
require 'date'
require 'simplecov'

module Hotel
  class Stay
    attr_reader :period
    def initialize(start_date, end_date)
      @period = date_range(start_date, end_date)
    end

    def date_range(start_date, end_date)
      new_range = (check_date(start_date)...check_date(end_date))
      return new_range
    end

    def list(date_range)

    end
    private
    def check_date(date)
      unless date.class == Date
        parsed_date = Date.parse(date)
        date = parsed_date
      end
      if date.class != Date
        raise StandardError.new("Invalid reservation date entry: #{date}")
      end
      compare = date <=> Date.today.prev_day
      if compare == -1
        raise StandardError.new("Invalid reservation date entry: #{date} has already passed.")
      end
      return date
    end
  end
end
