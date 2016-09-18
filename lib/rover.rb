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

  def take_action(action)
    case action
      when 'R' then turn_right
      when 'L' then turn_left
      when 'M' then go_forward
    end
  end

  def move
    while (action = @coordinates.shift)
      take_action(action)
    end
  end

  def to_string
    "#{@current_position[:x]} #{@current_position[:y]} #{@current_position[:face]}"
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

  def go_forward
    x, y = 
    case @current_position[:face]
      when 'N' then [0, 1]
      when 'S' then [0, -1]
      when 'E' then [1, 0]
      when 'W' then [-1, 0]
    end

    new_x = @current_position[:x] + x
    new_y = @current_position[:y] + y

    if @mars_grid.within_bounds?(new_x, new_y)
      current_position[:x] = new_x
      current_position[:y] = new_y
    end
  end



end