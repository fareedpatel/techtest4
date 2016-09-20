require 'models/rover.rb'
class MarsGrid
  attr_reader :height, :width, :rovers

  def initialize (input)
    @coordinates = input.split
    @rovers = []
    parse_mars_grid
    parse_rovers
  end

  def within_bounds?(x, y)
    x >= 0 and x <= @height and
    y >= 0 and y <= @width
  end

  def move_rovers
    @rovers.each &:move
  end

private
  def parse_mars_grid
    @height = @coordinates.shift.to_i
    @width = @coordinates.shift.to_i
  end

  def parse_rovers
    @coordinates.each_slice(4) do |x, y, face, steps|
    @rovers << Rover.new([x, y, face, steps], self)
    end
  end

end