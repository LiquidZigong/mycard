class User
  attr_accessor :id, :name
  extend Cacheable
  def set(id, name = "")
    @id = id
    @name = name if name
  end
  def avatar(size = :small)
    Surface.new(SWSURFACE, 1, 1, 32, 0,0,0,0)
  end
  def status
    room = room()
    case
    when room.nil?
      :hall
    when room.player2
      :dueling
    else
      :waiting
    end
  end
  def room
    $game && $game.rooms.find{|room|room.player1 == self or room.player2 == self}
  end
end