# frozen_string_literal: true

require_relative '../mixins/interfaceable'

module AwesomeToyRobotSimulator
  module Interfaces
    class CLI
      extend Interfaceable

      class << self
        def start(_)
          raise NotImplementedError
        end
      end
    end
  end
end
