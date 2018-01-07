# frozen_string_literal: true
class Rover
  class InvalidMove < StandardError; end
  attr_reader :direction, :location

  def initialize(direction, start_location = [0, 0], plateau_area = [5, 5])
    @direction = direction
    @location = start_location
    @plateau_area = plateau_area
  end

  def to_forward
    @location = @direction.to_forward(@location)
    return @location unless exceed_plateau_area?
    raise InvalidMove
  end

  def exceed_plateau_area?
    return true if @location.first.negative? ||
                   @location.first > @plateau_area.first
    return true if @location.last.negative? ||
                   @location.last > @plateau_area.last
    false
  end

  def to_right
    @direction = @direction.to_right
  end

  def to_left
    @direction = @direction.to_left
  end

  def to_s
    "#{@location[0]} #{@location[1]} #{@direction}"
  end
end
