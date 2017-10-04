# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class ToyRobot
    extend Forwardable

    attr_reader :direction, :position, :tabletop

    def initialize(tabletop)
      @tabletop = tabletop
    end

    def place(x_axis, y_axis, cardinal_direction_name)
      position = Position.new(x_axis, y_axis)

      return unless tabletop.within_bounds?(position)

      @direction = Direction.new(cardinal_direction_name)
      @position = position

      self
    end

    def update(attr, value)
      instance_variable_set(attr, value)
    end

    def_delegators :automaton, :report, :step_forward, :turn_left, :turn_right

    private

    def automaton
      return NullAutomaton.new unless placed?

      Automaton.new(self)
    end

    def placed?
      tabletop && direction
    end
  end
end
