# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Runner do
    subject { described_class.run(options: options) }

    describe '#run' do
      let(:files) do
        Dir[File.join(File.expand_path('..', File.dirname(__FILE__)), '**/*.txt')]
      end
      let(:expected_reports) do
        ['0,1,NORTH', '0,0,WEST', '3,3,NORTH']
      end

      before { allow($stdout).to receive(:puts) }

      it 'prints the processed file reports' do
        files.each_with_index do |file, index|
          described_class.run(options: { file: file })

          expect($stdout).to have_received(:puts).with(expected_reports[index])
        end
      end
    end
  end
end
