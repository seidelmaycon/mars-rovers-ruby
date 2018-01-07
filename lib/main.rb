# frozen_string_literal: true
require_relative '../lib/navigation'
require_relative '../lib/rover'
plateau = ARGF.gets
plateau = [plateau[0].to_i, plateau[2].to_i]

until ARGF.eof
  rover_position = ARGF.gets
  position = rover_position.split[0, 2]
  direction = Navigation.turns_to(rover_position.split[2])

  @rover = Rover.new(direction, position, plateau)
  operations_line = ARGF.gets
  operations_line.each_char do |operation|
    if operation == 'L'
      @rover.to_left
    elsif operation == 'R'
      @rover.to_right
    elsif operation == 'M'
      @rover.to_forward
    end
  end

  puts @rover
end
