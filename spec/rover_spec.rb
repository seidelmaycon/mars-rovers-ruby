# frozen_string_literal: true
require 'spec_helper'

RSpec.shared_examples 'turns_rover_left' do |from_direction, to_direction|
  context 'turns to left' do
    it "should returns #{to_direction}" do
      eval(from_direction).to_left
      expect(eval(from_direction).direction.to_s).to eq to_direction
    end
  end
end

RSpec.shared_examples 'turns_rover_right' do |from_direction, to_direction|
  context 'turns to left' do
    it "should turns rover to #{to_direction} direction" do
      eval(from_direction).to_right
      expect(eval(from_direction).direction.to_s).to eq to_direction
    end
  end
end

RSpec.shared_examples 'move_rover_forward' do |from_direction, response|
  context 'moving rover forward' do
    it 'should increment x or y' do
      eval(from_direction).to_forward
      expect(eval(from_direction).location).to eq(response)
    end
  end
end

RSpec.describe Rover do
  let(:east) { Rover.new(East.new) }
  let(:north) { Rover.new(North.new) }
  let(:south) { Rover.new(South.new, [1, 1]) }
  let(:west) { Rover.new(West.new, [1, 1]) }

  context 'when initialize to north' do
    it_behaves_like 'turns_rover_left', 'east', 'N'
    it_behaves_like 'turns_rover_left', 'north', 'W'
    it_behaves_like 'turns_rover_left', 'south', 'E'
    it_behaves_like 'turns_rover_left', 'west', 'S'
  end

  context 'when turns right' do
    it_behaves_like 'turns_rover_right', 'east', 'S'
    it_behaves_like 'turns_rover_right', 'north', 'E'
    it_behaves_like 'turns_rover_right', 'south', 'W'
    it_behaves_like 'turns_rover_right', 'west', 'N'
  end

  context 'when move move forward' do
    it_behaves_like 'move_rover_forward', 'east', [1, 0]
    it_behaves_like 'move_rover_forward', 'north', [0, 1]
    it_behaves_like 'move_rover_forward', 'south', [1, 0]
    it_behaves_like 'move_rover_forward', 'west', [0, 1]
  end

  context 'negative scenaries' do
    context 'when a negative coordinate is catched' do
      let(:rover) { Rover.new(South.new) }
      it 'should raise InvalidMove' do
        expect { rover.to_forward }
          .to raise_error(Rover::InvalidMove)
      end
    end
  end
end
