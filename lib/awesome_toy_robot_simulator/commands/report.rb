# frozen_string_literal: true

module AwesomeToyRobotSimulator
  module Commands
    class Report
      def initialize(toy_robot, _, output = $stdout)
        @toy_robot = toy_robot
        @output = output
      end

      def run
        report = @toy_robot.report

        @output.puts(report)
      end
    end
  end
end
