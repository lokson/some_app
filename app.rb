require File.expand_path('command', File.dirname(__FILE__))
require File.expand_path('robot', File.dirname(__FILE__))

# Application class
# Context, Parser and Tabletop responsibilities
class App
  attr_accessor :robot

  # register all commands here
  COMMAND_CLASSESS = [Place, Move, Left, Right, Report]

  def initialize()
    @buffer = ''
    @robot = nil
  end

  def exec(input)
    @buffer << input
    output  = []
    # gradually eat buffer by regexp
    while(match = next_match()) do
      @buffer = match.post_match
      command = make_command(match)
      output << command.run()
    end
    output.compact.join("\n")
  end

  # handle wrong input, match what's possible
  def next_match
    any_command_pattern = (COMMAND_CLASSESS.map &:pattern).join('|')
    /#{any_command_pattern}/.match(@buffer)
  end

  # turn string into Command instance
  def make_command(arg)
    string = arg.to_s
    COMMAND_CLASSESS.each do |klass|
      match = /#{klass.pattern}/.match(string)
      return klass.new(match.captures,self) if match
    end
  end

  DIRECTIONS = %w[NORTH EAST SOUTH WEST]
  def on_tabletop?(location)
    (0..4).include?(location[:x]) && (0..4).include?(location[:y])
  end
end

