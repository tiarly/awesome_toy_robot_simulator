# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe PositionCreator do
    shared_examples 'a_position_creator' do
      it 'returns the new calculated x_axis position' do
        expect(subject.x_axis).to eql expected_x_axis
      end

      it 'returns the new calculated y_axis position' do
        expect(subject.y_axis).to eql expected_y_axis
      end

      it 'returns a new Position' do
        is_expected.to be_a Position
      end
    end

    describe '#call' do
      subject { described_class.call(input) }

      let(:current_position) { Position.new(2, 5) }

      context 'when passing only position' do
        let(:input) { { position: current_position } }
        let(:expected_x_axis) { 2 }
        let(:expected_y_axis) { 5 }

        it_behaves_like 'a_position_creator'
      end

      context 'when passing position and both x_axis and y_axis' do
        let(:input) do
          {
            position: current_position,
            x_axis: PositionCreator::PLUS_ONE,
            y_axis: PositionCreator::MINUS_ONE
          }
        end
        let(:expected_x_axis) { 3 }
        let(:expected_y_axis) { 4 }

        it_behaves_like 'a_position_creator'
      end

      context 'when passing position and x_axis position' do
        context 'when using MINUS_ONE operation' do
          let(:input) { { position: current_position, x_axis: PositionCreator::MINUS_ONE } }
          let(:expected_x_axis) { 1 }
          let(:expected_y_axis) { 5 }

          it_behaves_like 'a_position_creator'
        end

        context 'when using PLUS_ONE operation' do
          let(:input) { { position: current_position, x_axis: PositionCreator::PLUS_ONE } }
          let(:expected_x_axis) { 3 }
          let(:expected_y_axis) { 5 }

          it_behaves_like 'a_position_creator'
        end
      end

      context 'when passing position and y_axis position' do
        context 'when using MINUS_ONE operation' do
          let(:input) { { position: current_position, y_axis: PositionCreator::MINUS_ONE } }
          let(:expected_x_axis) { 2 }
          let(:expected_y_axis) { 4 }

          it_behaves_like 'a_position_creator'
        end

        context 'when using PLUS_ONE operation' do
          let(:input) { { position: current_position, y_axis: PositionCreator::PLUS_ONE } }
          let(:expected_x_axis) { 2 }
          let(:expected_y_axis) { 6 }

          it_behaves_like 'a_position_creator'
        end
      end
    end
  end
end
