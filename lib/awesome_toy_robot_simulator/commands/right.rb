# frozen_string_literal: true

module AwesomeToyRobotSimulator
  module Commands
    class Right
      extend Forwardable

      def initialize(toy_robot, _)
        @toy_robot = toy_robot
      end

      def_delegator :@toy_robot, :turn_right, :run
    end
  end
end
