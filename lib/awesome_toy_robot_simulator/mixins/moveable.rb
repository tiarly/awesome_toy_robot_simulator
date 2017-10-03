# frozen_string_literal: true

module AwesomeToyRobotSimulator
  module Moveable
    def left
      raise NotImplementedError
    end

    def right
      raise NotImplementedError
    end

    def step_forward(_)
      raise NotImplementedError
    end
  end
end
