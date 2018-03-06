require_relative 'spec_helper'

describe "Room" do
  describe "Room#Initialize" do
    it "can be created" do
      result = Hotel::Room.new(1)
      result.must_be_instance_of Hotel::Room
    end

    it "knows its number" do
      numbers = (1..20).to_a
      numbers.each do |num|
        result = Hotel::Room.new(num)


        result.room_number.must_equal num

      end
    end

    it "knows its cost per night" do
      result = Hotel::Room.new(1)
      result.cost_per_night.must_equal 200
    end
  end

  describe "Room#change_status" do
    before do
      @rooms = []
      numbers = (1..20).to_a
      numbers.each do |num|
        rooms << Room.new(num)
      end

      it "does not accept an invalid status" do
        room = @rooms[0]
        proc{ room.change_status(new_status: :UNAVAILABLE)}.must_raise StandardError
      end

      it "defaults to a status of :RESERVED with no argument" do
        room = @rooms[0]
        result = room.change_status

        result.must_equal :RESERVED
      end

      it "Can change a :RESERVED status to :AVAILABLE" do
        room = @rooms[0]
        room.change_status
        result = room.change_status(new_status: :AVAILABLE)

        result.must_equal :AVAILABLE
      end


    end
  end
end
