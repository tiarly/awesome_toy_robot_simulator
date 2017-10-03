# frozen_string_literal: true

require_relative '../mixins/moveable'
require_relative '../services/position_creator'

module AwesomeToyRobotSimulator
  module Directions
    class North
      extend Moveable

      class << self
        def left
          West
        end

        def right
          East
        end

        def step_forward(current_position)
          PositionCreator.call(
            position: current_position,
            y_axis: PositionCreator::PLUS_ONE
          )
        end
      end
    end
  end
end
