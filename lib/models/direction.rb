class Direction
  attr_reader :compass_keys

  COMPASS_KEYS = {
    N: { left: :W, right: :E, go_forward: [0, 1]  },
    S: { left: :E, right: :W, go_forward: [0, -1] },
    W: { left: :S, right: :N, go_forward: [-1, 0] },
    E: { left: :N, right: :S, go_forward: [1, 0]  }
  }

  def initialize(compass_keys)
    @compass_keys = compass_keys.to_sym
  end

  def turn_right
    Direction.new(COMPASS_KEYS[compass_keys][:right])
  end

  def turn_left
    Direction.new(COMPASS_KEYS[compass_keys][:left])
  end

  def to_s
    compass_keys.to_s
  end

  def go_forward
    COMPASS_KEYS[compass_keys][:go_forward]
  end

end