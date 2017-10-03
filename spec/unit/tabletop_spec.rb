# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Tabletop do
    let(:instance) { described_class.new(5, 5) }

    describe '.within_bounds?' do
      subject { instance.within_bounds?(position) }

      context 'when position is within bounds' do
        let(:position) { Position.new(3, 2) }

        it 'returns true' do
          is_expected.to eql true
        end
      end

      context 'when position is not within bounds' do
        let(:position) { Position.new(6, 2) }

        it 'returns false' do
          is_expected.to eql false
        end
      end
    end
  end
end
