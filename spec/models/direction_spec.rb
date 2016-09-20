require 'spec_helper'
require 'models/direction'

describe Direction do
  let(:south) { described_class.new('S') }
  let(:north) { described_class.new('N') }
  let(:west)  { described_class.new('W') }
  let(:east)  { described_class.new('E') }

  context 'When facing south,' do
    describe 'changing the direction;' do
      it 'turns the object to the left' do
        expect(south.turn_left.to_s).to eq 'E'
      end

      it 'turns the object to the right' do
        expect(south.turn_right.to_s).to eq 'W'
      end
    end

    describe 'moves forward;' do
      it 'returns the new co-ordinate' do
      expect(south.go_forward).to eq [0, -1]
      end
    end
  end

  context 'When facing north,' do
    describe 'changing the direction;' do
      it 'turns the object to the left' do
        expect(north.turn_left.to_s).to eq 'W'
      end

      it 'turns the object to the right' do
        expect(north.turn_right.to_s).to eq 'E'
      end
    end

    describe 'moves forward;' do
      it 'returns the new co-ordinate' do
      expect(north.go_forward).to eq [0, 1]
      end
    end
  end

  context 'When facing west,' do
    describe 'changing the direction;' do
      it 'turns the object to the left' do
        expect(west.turn_left.to_s).to eq 'S'
      end

      it 'turns the object to the right' do
        expect(west.turn_right.to_s).to eq 'N'
      end
    end

    describe 'moves forward;' do
      it 'returns the new co-ordinate' do
      expect(west.go_forward).to eq [-1, 0]
      end
    end
  end

  context 'When facing east,' do
    describe 'changing the direction;' do
      it 'turns the object to the left' do
        expect(east.turn_left.to_s).to eq 'N'
      end

      it 'turns the object to the right' do
        expect(east.turn_right.to_s).to eq 'S'
      end
    end

    describe 'moves forward;' do
      it 'returns the new co-ordinate' do
      expect(east.go_forward).to eq [1, 0]
      end
    end
  end

    describe 'to_s method;' do
      it 'it converts the key to a string' do
       expect(south.to_s).to eq 'S' 
      end
    end
end
