# frozen_string_literal: true
require_relative '../direction'
class North < Direction
  def to_forward(current_location)
    x = current_location[0]
    y = current_location[1]

    [x.to_i, y.to_i + 1.to_i]
  end

  def to_s
    'N'
  end
end
