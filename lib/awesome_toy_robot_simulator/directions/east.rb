# frozen_string_literal: true

require_relative '../mixins/moveable'
require_relative '../services/position_creator'

module AwesomeToyRobotSimulator
  module Directions
    class East
      extend Moveable

      class << self
        def left
          North
        end

        def right
          South
        end

        def step_forward(current_position)
          PositionCreator.call(
            position: current_position,
            x_axis: PositionCreator::PLUS_ONE
          )
        end
      end
    end
  end
end
