# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Directions
    RSpec.describe South do
      describe '#left' do
        subject { described_class.left }

        it 'returns East Direction' do
          is_expected.to eql Directions::East
        end
      end

      describe '#right' do
        subject { described_class.right }

        it 'returns West Direction' do
          is_expected.to eql Directions::West
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
            y_axis: PositionCreator::MINUS_ONE
          )
        end

        it 'returns a new position' do
          is_expected.to eql new_position
        end
      end
    end
  end
end
