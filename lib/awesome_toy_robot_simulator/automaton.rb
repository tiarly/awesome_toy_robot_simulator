# frozen_string_literal: true

require 'delegate'

module AwesomeToyRobotSimulator
  class Automaton < SimpleDelegator
    def report
      [position.x_axis, position.y_axis, direction].join(',')
    end

    def step_forward
      new_position = direction.step_forward(position)

      return unless tabletop.within_bounds?(new_position)

      toy_robot.tap { |robot| robot.update(:@position, new_position) }
    end

    def turn_left
      toy_robot.tap { |robot| robot.update(:@direction, direction.left) }
    end

    def turn_right
      toy_robot.tap { |robot| robot.update(:@direction, direction.right) }
    end

    private

    def toy_robot
      __getobj__
    end
  end
end
