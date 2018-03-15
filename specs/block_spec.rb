require_relative 'spec_helper'

describe "Block" do
before do
  @booking_manager = Hotel::BookingManager.new
  @block1 = @booking_manager.reserve_block("apr4, 2018", "apr7, 2018")
end
describe "Block#initialize" do
it "creates a block with an id, rooms and a date_range" do
  # test that it creates a user
  result = @block1

  result.must_be_instance_of Hotel::Block

  result.id.must_be_kind_of Integer
  result.rooms.must_be_kind_of Array
  result.period.length.wont_be_nil
end

it "won't accept a block with rooms from another block" do
  proc{
    @booking_manager.reserve_block("apr4, 2018", "apr7, 2018")
  }.must_raise StandardError
end


end

it "can do things" do
  # create as many tests as are needed to make sure
  # that the user can actually navigate the program
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
