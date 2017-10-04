# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class Runner
    class << self
      def run(interface: :file, options:)
        @options = options

        InterfaceLoader.call(interface).start(toy_robot, options)
      end

      private

      attr_reader :options

      def toy_robot
        ToyRobot.new(tabletop)
      end

      def tabletop
        width, height = options.fetch(:table_sizes, Tabletop::DEFAULT_TABLE_SIZES)

        Tabletop.new(width, height)
      end
    end
  end
end
