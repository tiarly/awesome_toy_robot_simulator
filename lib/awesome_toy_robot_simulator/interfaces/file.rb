# frozen_string_literal: true

require_relative '../mixins/interfaceable'

module AwesomeToyRobotSimulator
  module Interfaces
    class File
      include Interfaceable

      def start(_)
        #@TODO
      end
    end
  end
end
