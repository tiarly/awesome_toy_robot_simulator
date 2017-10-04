# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Interfaces
    RSpec.describe File do
      describe '#start' do
        subject { described_class.start(toy_robot, file: file) }

        let(:toy_robot) { instance_double(ToyRobot) }
        let(:file) { double(:file) }
        let(:file_lines) { ['PLACE 1,2,NORTH', 'MOVE', 'REPORT'] }
        let(:parser) { instance_double(CommandParser) }
        let(:command) { double(:command) }

        before do
          allow(IO).to receive(:readlines).and_return(file_lines)
          allow(CommandParser).to receive(:new).and_return(parser)
          allow(parser).to receive(:process).and_return(command)
          allow(command).to receive(:run)
        end

        it 'reads the passed in file' do
          subject

          expect(IO).to have_received(:readlines).with(file)
        end

        it 'parses each file line' do
          subject

          file_lines.each do |file_line|
            expect(parser).to have_received(:process).with(file_line)
          end
        end

        it 'runs the parsed command' do
          subject

          expect(command).to have_received(:run).at_least(3)
        end
      end
    end
  end
end
