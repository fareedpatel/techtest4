require 'mars_grid'
class Rover
  attr_reader :current_position

  def initialize(input, mars_grid)
    @mars_grid = mars_grid
    @coordinates = input.join.split(//)
    @current_position = {
      x: input.shift.to_i,
      y: input.shift.to_i,
      face: input.shift
      }
  end

  def do(move)
    case move
    when 'R' then turn_right
    when 'L' then turn_left
    end
  end


private

def turn_right
  @current_position[:face] = 
  case @current_position[:face]
    when 'N' then 'E'
    when 'E' then 'S'
    when 'S' then 'W'
    when 'W' then 'N'
  end
end

def turn_left
  @current_position[:face] = 
  case @current_position[:face]
    when 'N' then 'W'
    when 'E' then 'N'
    when 'S' then 'E'
    when 'W' then 'S'
  end
end

end