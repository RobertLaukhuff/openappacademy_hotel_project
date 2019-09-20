require_relative "room"
require "byebug"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = Hash.new
    rooms.each do |k, v|
      @rooms[k] = Room.new(v)
    end
  end

  def name
    name = @name.split(' ')
    name.map! {|n| n.capitalize!}
    name.join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(guest, room_name)
    if room_exists?(room_name)
      if @rooms[room_name].add_occupant(guest)
        print "check in successful"
      else
        print "sorry, room is full"
      end
    else
      print "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.each_value do |room|
      if !room.full?
        return true
      end
    end

    false
  end

  def list_rooms
    @rooms.each do |room_name, room|
      print room_name + " " +room.available_space.to_s + "\n"
    end
  end
end