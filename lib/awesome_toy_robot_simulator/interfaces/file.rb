# frozen_string_literal: true

require_relative '../mixins/interfaceable'
require_relative '../command_parser'

module AwesomeToyRobotSimulator
  module Interfaces
    class File
      extend Interfaceable

      class << self
        def start(toy_robot, options = {})
          file_lines = IO.readlines(options[:file])
          parser = CommandParser.new(toy_robot)

          file_lines.each do |file_line|
            parser.process(file_line).run
          end
        end
      end
    end
  end
end
