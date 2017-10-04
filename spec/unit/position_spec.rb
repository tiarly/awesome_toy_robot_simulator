# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Position do
    let(:instance) { described_class.new(2, 3) }

    describe '.x' do
      subject { instance.x_axis }

      context 'returns current x_axis value' do
        it 'returns 2' do
          is_expected.to eql 2
        end
      end
    end

    describe '.y_axis' do
      subject { instance.y_axis }

      context 'returns current y_axis value' do
        it 'returns 3' do
          is_expected.to eql 3
        end
      end
    end
  end
end
