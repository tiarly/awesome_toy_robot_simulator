# frozen_string_literal: true

module AwesomeToyRobotSimulator
  module Commands
    class Move
      extend Forwardable

      def initialize(toy_robot, _)
        @toy_robot = toy_robot
      end

      def_delegator :@toy_robot, :step_forward, :run
    end
  end
end
