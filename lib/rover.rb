# frozen_string_literal: true
class Rover
  class InvalidMove < StandardError; end
  attr_reader :direction, :location

  def initialize(direction, start_location = [0, 0], plateau_area = [5, 5])
  end

  def to_forward
  end

  def exceed_plateau_area?
  end

  def to_right
  end

  def to_left
  end

  def to_s
  end
end
