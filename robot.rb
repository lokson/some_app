class Robot
  def initialize(location)
    @location = location
  end

  def move
    new_location = @location
    case @location[:direction]
      when 'NORTH'; then new_location[:y] += 1
      when 'EAST'; then new_location[:x] += 1
      when 'SOUTH'; then new_location[:y] -= 1
      when 'WEST'; then new_location[:x] -= 1
    end
    if App.instance.on_tabletop?(new_location)
      @location = new_location
    end
  end

  def left
    current = App::DIRECTIONS.index(@location[:direction])
    @location[:direction] = App::DIRECTIONS[(current - 1) % 4]
  end

  def right
    current = App::DIRECTIONS.index(@location[:direction])
    @location[:direction] = App::DIRECTIONS[(current + 1) % 4]
  end

  def report
    "#{@location[:x]},#{@location[:y]},#{@location[:direction]}"
  end
end

