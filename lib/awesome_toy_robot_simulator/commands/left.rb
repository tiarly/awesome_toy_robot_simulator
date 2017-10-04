# frozen_string_literal: true

module AwesomeToyRobotSimulator
  module Commands
    class Left
      extend Forwardable

      def initialize(toy_robot, _)
        @toy_robot = toy_robot
      end

      def_delegator :@toy_robot, :turn_left, :run
    end
  end
end
