# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe ToyRobot do
    let(:instance) { described_class.new(table) }
    let(:table) { Tabletop.new(5, 5) }

    describe '.place' do
      subject { instance.place(x_axis, y_axis, cardinal_direction_name) }

      context 'when position is within bounds' do
        let(:x_axis) { 2 }
        let(:y_axis) { 3 }
        let(:cardinal_direction_name) { 'north' }

        it 'sets a new x_axis position' do
          expect(subject.position.x_axis).to eql 2
        end

        it 'sets a new y_axis position' do
          expect(subject.position.y_axis).to eql 3
        end

        it 'returns the instance toy robot' do
          is_expected.to eql instance
        end
      end

      context 'when position is not within bounds' do
        let(:x_axis) { 6 }
        let(:y_axis) { 2 }
        let(:cardinal_direction_name) { 'north' }

        it 'does not set the position' do
          subject

          expect(instance.position).to eql nil
        end

        it 'returns nil' do
          is_expected.to eql nil
        end

        it 'does not change the current toy robot' do
          subject

          expect(instance).to_not eql nil
        end
      end
    end

    describe '.update' do
      subject { instance.update(*input) }

      context 'when updating a position' do
        let(:input) { [:@position, new_position] }
        let(:new_position) { instance_double(Position) }

        it 'updates the current position' do
          subject

          expect(instance.position).to eql new_position
        end
      end

      context 'when updating a direction' do
        let(:input) { [:@direction, new_direction] }
        let(:new_direction) { instance_double(Direction) }

        it 'updates the current direction' do
          subject

          expect(instance.direction).to eql new_direction
        end
      end
    end

    describe '.step_forward' do
      subject { instance.step_forward }

      context 'when toy robot is placed' do
        let(:automaton) { instance_double(Automaton) }
        let(:position) { instance_double(Position) }
        let(:direction) { instance_double(Direction) }

        before do
          allow(instance).to receive(:position).and_return(position)
          allow(instance).to receive(:direction).and_return(direction)
          allow(Automaton).to receive(:new).and_return(automaton)
          allow(automaton).to receive(:step_forward).and_return(instance)
        end

        it 'delegates to Automaton.step_forward' do
          subject

          expect(automaton).to have_received(:step_forward)
        end

        it 'returns current toy robot' do
          is_expected.to eql instance
        end
      end

      context 'when toy robot is not placed' do
        let(:null_automaton) { instance_double(NullAutomaton) }

        before do
          allow(instance).to receive(:position).and_return(nil)
          allow(instance).to receive(:direction).and_return(nil)
          allow(NullAutomaton).to receive(:new).and_return(null_automaton)
          allow(null_automaton).to receive(:step_forward)
        end

        it 'delegates to NullAutomaton.step_forward' do
          subject

          expect(null_automaton).to have_received(:step_forward)
        end

        it 'returns nil' do
          is_expected.to eql nil
        end

        it 'does not change the current toy robot' do
          subject

          expect(instance).to_not eql nil
        end
      end
    end

    describe '.turn_left' do
      subject { instance.turn_left }

      let(:direction) { instance_double(Direction) }

      context 'when toy robot is placed' do
        let(:automaton) { instance_double(Automaton) }
        let(:position) { instance_double(Position) }
        let(:direction) { instance_double(Direction) }

        before do
          allow(instance).to receive(:position).and_return(position)
          allow(instance).to receive(:direction).and_return(direction)
          allow(Automaton).to receive(:new).and_return(automaton)
          allow(automaton).to receive(:turn_left).and_return(instance)
        end

        it 'delegates to Automaton.turn_left' do
          subject

          expect(automaton).to have_received(:turn_left)
        end

        it 'returns current toy robot' do
          is_expected.to eql instance
        end
      end

      context 'when toy robot is not placed' do
        let(:null_automaton) { instance_double(NullAutomaton) }

        before do
          allow(instance).to receive(:position).and_return(nil)
          allow(instance).to receive(:direction).and_return(nil)
          allow(NullAutomaton).to receive(:new).and_return(null_automaton)
          allow(null_automaton).to receive(:turn_left)
        end

        it 'delegates to NullAutomaton.turn_left' do
          subject

          expect(null_automaton).to have_received(:turn_left)
        end

        it 'returns nil' do
          is_expected.to eql nil
        end

        it 'does not change the current toy robot' do
          subject

          expect(instance).to_not eql nil
        end
      end
    end

    describe '.turn_right' do
      subject { instance.turn_right }

      let(:direction) { instance_double(Direction) }

      context 'when toy robot is placed' do
        let(:automaton) { instance_double(Automaton) }
        let(:position) { instance_double(Position) }
        let(:direction) { instance_double(Direction) }

        before do
          allow(instance).to receive(:position).and_return(position)
          allow(instance).to receive(:direction).and_return(direction)
          allow(Automaton).to receive(:new).and_return(automaton)
          allow(automaton).to receive(:turn_right).and_return(instance)
        end

        it 'delegates to Automaton.turn_right' do
          subject

          expect(automaton).to have_received(:turn_right)
        end

        it 'returns current toy robot' do
          is_expected.to eql instance
        end
      end

      context 'when toy robot is not placed' do
        let(:null_automaton) { instance_double(NullAutomaton) }

        before do
          allow(instance).to receive(:position).and_return(nil)
          allow(instance).to receive(:direction).and_return(nil)
          allow(NullAutomaton).to receive(:new).and_return(null_automaton)
          allow(null_automaton).to receive(:turn_right)
        end

        it 'delegates to NullAutomaton.turn_right' do
          subject

          expect(null_automaton).to have_received(:turn_right)
        end

        it 'returns nil' do
          is_expected.to eql nil
        end

        it 'does not change the current toy robot' do
          subject

          expect(instance).to_not eql nil
        end
      end
    end
  end
end
