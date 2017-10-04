# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class CardinalDirectionFactory
    InvalidDirectionNameError = Class.new(StandardError)

    class << self
      KLASS_SEPARATOR = '::'

      def call(name:)
        Module.const_get(
          "#{parent_module}#{KLASS_SEPARATOR}Directions#{KLASS_SEPARATOR}#{name.capitalize}"
        )
      rescue NameError
        raise InvalidDirectionNameError
      end

      private

      def parent_module
        name.split(KLASS_SEPARATOR).first
      end
    end
  end
end
