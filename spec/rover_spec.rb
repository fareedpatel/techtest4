require 'rover'
describe Rover do
  let (:input) { ['1', '2', 'N', 'LMLMLMLMM'] }

  before :each do
    @mars_grid = MarsGrid.new "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM"
    @rover = Rover.new input, @mars_grid
  end

  it 'turns right when given R instruction' do
    @rover.do 'R'
    expect(@rover.current_position[:face]).to eq('E')
  end

  it 'turn left when given L instruction' do
    @rover.do 'L'
    expect(@rover.current_position[:face]).to eq('W')
  end


end