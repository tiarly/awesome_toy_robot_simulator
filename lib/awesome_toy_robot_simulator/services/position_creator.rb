# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class PositionCreator
    PLUS_ZERO = 0
    PLUS_ONE = 1
    MINUS_ONE = -1

    class << self
      def call(position:, x_axis: PLUS_ZERO, y_axis: PLUS_ZERO)
        Position.new(position.x_axis + x_axis, position.y_axis + y_axis)
      end
    end
  end
end
