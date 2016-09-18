require 'rover'
require 'mars_grid'
describe Rover do
  let (:input) { ['1', '2', 'N', 'LMLMLMLMM'] }

  before :each do
    @mars_grid = MarsGrid.new "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM"
    @rover = Rover.new input, @mars_grid
  end

  it 'turns right when given R instruction' do
    @rover.take_action 'R'
    expect(@rover.current_position[:face]).to eq('E')
  end

  it 'turn left when given L instruction' do
    @rover.take_action 'L'
    expect(@rover.current_position[:face]).to eq('W')
  end

  it 'moves forward one when given instruction M' do
    @rover.take_action 'M'
    expect(@rover.current_position[:x]).to eq(1)
    expect(@rover.current_position[:y]).to eq(3)

    @rover.take_action 'R'
    @rover.take_action 'M'
    expect(@rover.current_position[:x]).to eq(2)
    expect(@rover.current_position[:y]).to eq(3)

    @rover.take_action 'L'
    @rover.take_action 'M'
    expect(@rover.current_position[:x]).to eq(2)
    expect(@rover.current_position[:y]).to eq(4)
  end

  it 'moves around' do
    @rover.move
    expect(@rover.current_position).to eq :x=>1, :y=>3, :face=>"N"
  end

  it 'converts it to a string' do
    @rover.move
    expect(@rover.to_string).to eq ('1 3 N')
  end

  it 'does not allow the rover get out of the mars grid' do
    5.times { @rover.take_action 'M' }
    @rover.take_action 'R'
    5.times { @rover.take_action 'M' }
    expect(@rover.current_position).to eq(x: 5, y: 5, face: 'E')

    @rover.take_action 'L'
    5.times { @rover.take_action 'M' }
    @rover.take_action 'L'
    5.times { @rover.take_action 'M' }
    expect(@rover.current_position).to eq(x: 0, y: 5, face: 'W')
  end
end