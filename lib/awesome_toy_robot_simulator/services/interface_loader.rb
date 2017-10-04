# frozen_string_literal: true

require_relative '../mixins/interfaceable'
require_relative '../interfaces/cli'
require_relative '../interfaces/file'

module AwesomeToyRobotSimulator
  class InterfaceLoader
    INTERFACES = {
      cli: Interfaces::CLI,
      file: Interfaces::File
    }.freeze

    class << self
      def call(key)
        INTERFACES[key].tap do |interface|
          raise Errors::InvalidInitializationError unless interface
        end
      end
    end
  end
end
