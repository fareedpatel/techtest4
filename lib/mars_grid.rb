class MarsGrid
  attr_reader :height, :width

  def initialize (input)
    @coordinates = input.split
    grid_size
  end

  def within_bounds?(x, y)
    x >= 0 and x <= @height and
    y >= 0 and y <= @width
  end


private
  def grid_size
    @height = @coordinates.shift.to_i
    @width = @coordinates.shift.to_i
  end

end