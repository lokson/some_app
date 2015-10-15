class Command
  def initialize(args,app)
    @args = args
    @app = app
  end
end



class Place < Command
  # matches params with whitespace, like "PLACE 0, 0 ,  NORTH"
  def self.pattern
    directions = App::DIRECTIONS.join('|')
    'PLACE\s*(\d+)\s*,\s*(\d+)\s*,\s*' + "(#{directions})"
  end

  def run
    location = { x: @args[0].to_i, y: @args[1].to_i }
    if @app.on_tabletop?(location)
      @app.robot = Robot.new(location, @args[2], @app)
    end
    nil
  end
end



class Move < Command
  def self.pattern
    'MOVE'
  end

  def run
    return unless @app.robot
    @app.robot.move()
    nil
  end
end



class Left < Command
  def self.pattern
    'LEFT'
  end

  def run
    return unless @app.robot
    @app.robot.left()
    nil
  end
end



class Right < Command
  def self.pattern
    'RIGHT'
  end

  def run
    return unless @app.robot
    @app.robot.right()
    nil
  end
end



class Report < Command
  def self.pattern
    'REPORT'
  end

  def run
    return unless @app.robot
    @app.robot.report()
  end
end

