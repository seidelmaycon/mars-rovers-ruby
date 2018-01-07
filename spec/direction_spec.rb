# frozen_string_literal: true
require 'spec_helper'

RSpec.shared_examples 'to_left' do |from_direction, to_direction|
  context 'turns to left' do
    it "should returns #{to_direction}" do
      expect(eval(from_direction).to_left.to_s)
        .to eq to_direction
    end
  end
end

RSpec.shared_examples 'to_right' do |from_direction, to_direction|
  context 'turns to left' do
    it "should returns #{to_direction}" do
      expect(eval(from_direction).to_right.to_s)
        .to eq(to_direction)
    end
  end
end

RSpec.describe Direction do
  let(:east) { East.new }
  let(:north) { North.new }
  let(:south) { South.new }
  let(:west) { West.new }

  context 'when turns left' do
    it_behaves_like 'to_left', 'east', 'N'
    it_behaves_like 'to_left', 'north', 'W'
    it_behaves_like 'to_left', 'south', 'E'
    it_behaves_like 'to_left', 'west', 'S'
  end

  context 'when turns right' do
    it_behaves_like 'to_right', 'east', 'S'
    it_behaves_like 'to_right', 'north', 'E'
    it_behaves_like 'to_right', 'south', 'W'
    it_behaves_like 'to_right', 'west', 'N'
  end
end
