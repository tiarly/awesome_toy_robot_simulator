# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Commands
    RSpec.describe Report do
      describe '#run' do
        subject { described_class.new(toy_robot, nil).run }

        let(:toy_robot) { instance_double(ToyRobot) }

        before do
          allow(toy_robot).to receive(:report)
          allow($stdout).to receive(:puts)
        end

        it 'delegates run to ToyRobot.report' do
          subject

          expect(toy_robot).to have_received(:report)
        end

        it 'prints report to the stdout' do
          subject

          expect($stdout).to have_received(:puts)
            .with(toy_robot.report)
        end
      end
    end
  end
end
