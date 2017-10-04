# frozen_string_literal: true

module AwesomeToyRobotSimulator
  class CommandParser
    COMMANDS_LIST = {
      move: Commands::Move,
      left: Commands::Left,
      right: Commands::Right,
      report: Commands::Report,
      place: Commands::Place
    }.freeze

    def initialize(toy_robot)
      @toy_robot = toy_robot
    end

    def process(raw_command_str)
      action, params = raw_command_str.split

      COMMANDS_LIST[action.downcase.to_sym].tap do |command|
        raise Errors::InvalidCommandError unless command
      end.new(@toy_robot, params)
    end
  end
end
