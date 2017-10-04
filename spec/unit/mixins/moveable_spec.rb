# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Moveable do
    class DummyMoveable
      extend Moveable
    end

    describe '#left' do
      subject { DummyMoveable.left }

      it 'raises NotImplementedError' do
        expect { subject }.to raise_error NotImplementedError
      end
    end

    describe '#right' do
      subject { DummyMoveable.right }

      it 'raises NotImplementedError' do
        expect { subject }.to raise_error NotImplementedError
      end
    end

    describe '#step_forward' do
      subject { DummyMoveable.step_forward(nil) }

      it 'raises NotImplementedError' do
        expect { subject }.to raise_error NotImplementedError
      end
    end
  end
end
