# frozen_string_literal: true
require 'spec_helper'

RSpec.shared_examples 'a navigation' do |direction, direction_char|
  context "turns to #{direction}" do
    it "should returns #{direction}" do
      expect(Navigation.turns_to(direction_char))
        .to eq(
          eval("Navigation::#{direction}")
        )
    end
  end
end

RSpec.describe Navigation do
  it_behaves_like 'a navigation', 'NORTH', 'N'
  it_behaves_like 'a navigation', 'SOUTH', 'S'
  it_behaves_like 'a navigation', 'WEST', 'W'
  it_behaves_like 'a navigation', 'EAST', 'E'
end

describe Navigation do
  describe '#turns_to' do
    context 'turns to invalid or nil direction' do
      it 'should raise an error' do
        expect { Navigation.turns_to('A') }
          .to raise_error(Navigation::DirectionNotFound)
        expect { Navigation.turns_to('') }
          .to raise_error(Navigation::DirectionNotFound)
      end
    end
  end
end
