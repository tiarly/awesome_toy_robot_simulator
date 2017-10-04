# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Commands
    RSpec.describe Right do
      describe '#run' do
        subject { described_class.new(toy_robot, nil).run }

        let(:toy_robot) { instance_double(ToyRobot) }

        before do
          allow(toy_robot).to receive(:turn_right)
        end

        it 'delegates run to ToyRobot.turn_right' do
          subject

          expect(toy_robot).to have_received(:turn_right)
        end
      end
    end
  end
end
