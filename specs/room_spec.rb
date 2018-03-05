require_relative 'spec_helper'

describe "Room" do
  it "can be created" do
    result = Hotel::Room.new(1)
    result.must_be_instance_of Hotel::Room
  end

  it "knows its number" do
    numbers = (1..20).to_a
    numbers.each do |num|
      result = Hotel::Room.new(num)
      result.number.must_equal num
    end
  end

  it "knows its cost per night" do
    result = Hotel::Room.new(1)
    result.cost_per_night.must_equal 200
  end
end
