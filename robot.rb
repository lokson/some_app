class Robot
  def initialize(location,direction,app)
    @location = location
    @direction = direction
    @app = app
  end

  def move
    new_location = @location.clone
    case @direction
      when 'NORTH'; then new_location[:y] += 1
      when 'EAST'; then new_location[:x] += 1
      when 'SOUTH'; then new_location[:y] -= 1
      when 'WEST'; then new_location[:x] -= 1
    end
    if @app.on_tabletop?(new_location)
      @location = new_location
    end
  end

  def left
    current = App::DIRECTIONS.index(@direction)
    @direction = App::DIRECTIONS[(current - 1) % 4]
  end

  def right
    current = App::DIRECTIONS.index(@direction)
    @direction = App::DIRECTIONS[(current + 1) % 4]
  end

  def report
    "#{@location[:x]},#{@location[:y]},#{@direction}"
  end
end

