class MarsGrid
  attr_reader :height, :width

  def initialize (input)
    @coordinates = input.split
    grid_size
  end

  def grid_size
    @height = @coordinates.shift.to_i
    @width = @coordinates.shift.to_i
  end

end