require 'mars_grid'
describe 'Mars Grid' do
  let (:input) { "5 5\n1 2 N\nLMLMLMLMM 3 3 E MMRMMRMRRM" }

  before :each do
    @mars_grid = MarsGrid.new input
  end

  it 'sets up a new Mars grid' do
    expect(@mars_grid).not_to eq (0)
  end

  it 'sets up the size of the grid' do
    expect(@mars_grid.height).to eq (5)
    expect(@mars_grid.width).to eq (5) 
  end
end