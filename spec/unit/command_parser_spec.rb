# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe CommandParser do
    let(:instance) { described_class.new(toy_robot) }
    let(:toy_robot) { instance_double(ToyRobot) }

    shared_examples 'a_parsed_command' do
      before do
        allow(expected_command_klass).to receive(:new)
          .and_return(expected_command)
      end

      it 'returns the parsed command' do
        is_expected.to eql expected_command
      end

      it 'instantiates the new command passing the current toy_robot' do
        subject

        expect(expected_command_klass).to have_received(:new).with(toy_robot, nil)
      end
    end

    describe '.process' do
      subject { instance.process(raw_command_str) }

      context 'when passing a valid move command' do
        let(:raw_command_str) { 'MOVE' }
        let(:expected_command) { instance_double(Commands::Move) }
        let(:expected_command_klass) { Commands::Move }

        it_behaves_like 'a_parsed_command'
      end

      context 'when passing a valid report command' do
        let(:raw_command_str) { 'REPORT' }
        let(:expected_command) { instance_double(Commands::Report) }
        let(:expected_command_klass) { Commands::Report }

        it_behaves_like 'a_parsed_command'
      end

      context 'when passing a valid place command' do
        let(:raw_command_str) { 'PLACE' }
        let(:expected_command) { instance_double(Commands::Place) }
        let(:expected_command_klass) { Commands::Place }

        it_behaves_like 'a_parsed_command'
      end

      context 'when passing a valid right command' do
        let(:raw_command_str) { 'RIGHT' }
        let(:expected_command) { instance_double(Commands::Right) }
        let(:expected_command_klass) { Commands::Right }

        it_behaves_like 'a_parsed_command'
      end

      context 'when passing a valid left command' do
        let(:raw_command_str) { 'LEFT' }
        let(:expected_command) { instance_double(Commands::Left) }
        let(:expected_command_klass) { Commands::Left }

        it_behaves_like 'a_parsed_command'
      end

      context 'when not passing a valid command' do
        let(:raw_command_str) { 'UNKNOWN' }

        it 'raises an Errors::InvalidCommandError' do
          expect { subject }.to raise_error Errors::InvalidCommandError
        end
      end
    end
  end
end
