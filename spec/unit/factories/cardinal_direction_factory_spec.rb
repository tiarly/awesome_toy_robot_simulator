# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe CardinalDirectionFactory do
    describe '#call' do
      subject { described_class.call(name: name) }

      context 'when passing north name' do
        let(:name) { 'north' }

        it 'returns North Direction class' do
          is_expected.to eql Directions::North
        end
      end

      context 'when passing east name' do
        let(:name) { 'east' }

        it 'returns East Direction class' do
          is_expected.to eql Directions::East
        end
      end

      context 'when passing south name' do
        let(:name) { 'south' }

        it 'returns South Direction class' do
          is_expected.to eql Directions::South
        end
      end

      context 'when passing west name' do
        let(:name) { 'west' }

        it 'returns West Direction class' do
          is_expected.to eql Directions::West
        end
      end

      context 'when passing unkown name' do
        let(:name) { 'unkown' }

        it 'returns West Direction class' do
          expect { subject }
            .to raise_error(CardinalDirectionFactory::InvalidDirectionNameError)
        end
      end
    end
  end
end
