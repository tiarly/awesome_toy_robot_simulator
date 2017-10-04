# frozen_string_literal: true

require_relative '../mixins/moveable'
require_relative '../services/position_creator'

module AwesomeToyRobotSimulator
  module Directions
    class West
      extend Moveable

      class << self
        def left
          South
        end

        def right
          North
        end

        def step_forward(current_position)
          PositionCreator.call(
            position: current_position,
            x_axis: PositionCreator::MINUS_ONE
          )
        end
      end
    end
  end
end
