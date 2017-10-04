# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Interfaceable do
    class DummyInterfaceable
      include Interfaceable
    end

    describe '.start' do
      subject { DummyInterfaceable.new.start(nil) }

      it 'raises NotImplementedError' do
        expect { subject }.to raise_error NotImplementedError
      end
    end
  end
end
