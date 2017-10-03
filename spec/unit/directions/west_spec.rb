# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Directions
    RSpec.describe West do
      describe '#left' do
        subject { described_class.left }

        it 'returns South Direction' do
          is_expected.to eql Directions::South
        end
      end

      describe '#right' do
        subject { described_class.right }

        it 'returns North Direction' do
          is_expected.to eql Directions::North
        end
      end

      describe '#step_forward' do
        subject { described_class.step_forward(position) }

        let(:position) { instance_double(Position) }
        let(:new_position) { instance_double(Position) }

        before do
          allow(PositionCreator).to receive(:call).and_return(new_position)
        end

        it 'delegates to PositionCreator' do
          subject

          expect(PositionCreator).to have_received(:call).with(
            position: position,
            x_axis: PositionCreator::MINUS_ONE
          )
        end

        it 'returns a new position' do
          is_expected.to eql new_position
        end
      end
    end
  end
end
