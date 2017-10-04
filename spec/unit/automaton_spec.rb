# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Automaton do
    let(:instance) { described_class.new(robot) }
    let(:table) { Tabletop.new(5, 5) }
    let(:robot) { ToyRobot.new(table) }

    describe '.report' do
      subject { instance.report }

      let(:position) { Position.new(2, 3) }
      let(:direction) { Direction.new('north') }

      before do
        allow(instance).to receive(:position).and_return(position)
        allow(instance).to receive(:direction).and_return(direction)
      end

      it 'returns the current toy robot report' do
        is_expected.to eql '2,3,NORTH'
      end
    end

    describe '.step_forward' do
      subject { instance.step_forward }

      context 'when position is within bounds' do
        let(:position) { Position.new(2, 3) }
        let(:direction) { Direction.new('north') }
        let(:new_position) { Position.new(2, 4) }

        before do
          allow(table).to receive(:within_bounds?).and_return(true)
          allow(instance).to receive(:position).and_return(position)
          allow(instance).to receive(:direction).and_return(direction)
          allow(direction).to receive(:step_forward).and_return(new_position)
        end

        it 'delegates to direction.step_forward' do
          subject

          expect(direction).to have_received(:step_forward).with(position)
        end

        it 'returns updates current_position' do
          subject

          expect(robot.position).to eql new_position
        end

        it 'returns the same toy robot object' do
          is_expected.to eql robot
        end
      end

      context 'when position is not within bounds' do
        let(:position) { Position.new(2, 3) }
        let(:direction) { Direction.new('north') }
        let(:new_position) { Position.new(6, 4) }

        before do
          allow(table).to receive(:within_bounds?).and_return(false)
          allow(instance).to receive(:position).and_return(position)
          allow(instance).to receive(:direction).and_return(direction)
          allow(direction).to receive(:step_forward).and_return(new_position)
        end

        it 'delegates to direction.step_forward' do
          subject

          expect(direction).to have_received(:step_forward).with(position)
        end

        it 'doest not update the position' do
          subject

          expect(instance.position).to eql position
        end

        it 'returns nil' do
          is_expected.to eql nil
        end

        it 'does not change the current toy robot object' do
          subject

          expect(robot).to_not eql nil
        end
      end
    end

    describe '.turn_left' do
      subject { instance.turn_left }

      let(:direction) { instance_double(Direction) }
      let(:new_direction) { instance_double(Direction) }

      before do
        allow(instance).to receive(:direction).and_return(direction)
        allow(direction).to receive(:left).and_return(new_direction)
      end

      it 'updates current direction' do
        subject

        expect(robot.direction).to eql new_direction
      end
    end

    describe '.turn_right' do
      subject { instance.turn_right }

      let(:direction) { instance_double(Direction) }
      let(:new_direction) { instance_double(Direction) }

      before do
        allow(instance).to receive(:direction).and_return(direction)
        allow(direction).to receive(:right).and_return(new_direction)
      end

      it 'updates current direction' do
        subject

        expect(robot.direction).to eql new_direction
      end
    end
  end
end
