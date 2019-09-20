class Room
  def initialize(number)
    @capacity = number
    @occupants = []
  end

  def capacity
    @capacity
  end
  
  def occupants
    @occupants
  end

  def full?
    if @occupants.length < @capacity
      return false
    end
    true
  end

  def available_space
    @capacity - @occupants.length 
  end

  def add_occupant(guest)
    if self.full?
      return false
    end

    @occupants << guest
    true
  end
end
