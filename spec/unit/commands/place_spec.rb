# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Commands
    RSpec.describe Place do
      describe '#run' do
        subject { described_class.new(toy_robot, params).run }

        let(:toy_robot) { instance_double(ToyRobot) }
        let(:params) { '0,0,NORTH' }

        before do
          allow(toy_robot).to receive(:place)
        end

        it 'delegates run to ToyRobot.place' do
          subject

          expect(toy_robot).to have_received(:place).with(0, 0, 'NORTH')
        end
      end
    end
  end
end
