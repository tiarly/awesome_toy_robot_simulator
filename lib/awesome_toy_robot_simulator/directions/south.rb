# frozen_string_literal: true

require_relative '../mixins/moveable'
require_relative '../services/position_creator'

module AwesomeToyRobotSimulator
  module Directions
    class South
      extend Moveable

      class << self
        def left
          East
        end

        def right
          West
        end

        def step_forward(current_position)
          PositionCreator.call(
            position: current_position,
            y_axis: PositionCreator::MINUS_ONE
          )
        end
      end
    end
  end
end
