# frozen_string_literal: true
class South < Direction
  def to_forward(current_location)
    x = current_location[0]
    y = current_location[1]

    [x.to_i, y.to_i - 1.to_i]
  end

  def to_s
    'S'
  end
end
