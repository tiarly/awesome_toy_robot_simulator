# frozen_string_literal: true

module AwesomeToyRobotSimulator
  module Commands
    class Place
      DELIMITER = ','

      def initialize(toy_robot, params)
        @toy_robot = toy_robot
        @x_axis, @y_axis, @direction = params.split(DELIMITER)
      end

      def run
        @toy_robot.place(@x_axis.to_i, @y_axis.to_i, @direction)
      end
    end
  end
end
