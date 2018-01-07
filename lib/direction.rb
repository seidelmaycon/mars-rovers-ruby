# frozen_string_literal: true
class Direction
  def to_left
    { 'N' => West.new,
      'E' => North.new,
      'W' => South.new,
      'S' => East.new }[to_s]
  end

  def to_right
    { 'N' => East.new,
      'E' => South.new,
      'W' => North.new,
      'S' => West.new }[to_s]
  end
end
