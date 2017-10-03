# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class Direction
    def initialize(cardinal_direction_name)
      @cardinal_direction = CardinalDirectionFactory.call(
        name: cardinal_direction_name
      )
    end

    def left
      @cardinal_direction = cardinal_direction.left

      self
    end

    def right
      @cardinal_direction = cardinal_direction.right

      self
    end

    def step_forward(current_position)
      cardinal_direction.step_forward(current_position)
    end

    def to_s
      cardinal_direction.name.split('::').last.upcase
    end

    private

    attr_reader :cardinal_direction
  end
end
