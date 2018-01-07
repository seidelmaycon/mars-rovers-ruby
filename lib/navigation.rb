# frozen_string_literal: true
require_relative '../lib/direction/north'
require_relative '../lib/direction/south'
require_relative '../lib/direction/east'
require_relative '../lib/direction/west'

module Navigation
  class DirectionNotFound < StandardError; end

  def self.turns_to(direction)
  end

  NORTH = North.new
  SOUTH = South.new
  EAST  = East.new
  WEST  = West.new
end
