# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Commands
    RSpec.describe Move do
      describe '#run' do
        subject { described_class.new(toy_robot, nil).run }

        let(:toy_robot) { instance_double(ToyRobot) }

        before do
          allow(toy_robot).to receive(:step_forward)
        end

        it 'delegates run to ToyRobot.step_forward' do
          subject

          expect(toy_robot).to have_received(:step_forward)
        end
      end
    end
  end
end
