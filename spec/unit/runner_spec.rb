# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Runner do
    subject { described_class.run(options: options) }

    describe '#run' do
      let(:interface) { double(:interface) }
      let(:toy_robot) { instance_double(ToyRobot) }
      let(:options) { {} }

      before do
        allow(ToyRobot).to receive(:new).and_return(toy_robot)
        allow(InterfaceLoader).to receive(:call).and_return(interface)
        allow(interface).to receive(:start)
      end

      it 'loads the interface' do
        subject

        expect(InterfaceLoader).to have_received(:call).with(:file)
      end

      it 'runs the interface' do
        subject

        expect(interface).to have_received(:start).with(toy_robot, options)
      end
    end
  end
end
