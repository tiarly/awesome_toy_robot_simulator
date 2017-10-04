# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe InterfaceLoader do
    describe '#call' do
      subject { described_class.call(interface) }

      context 'when using CLI interface' do
        let(:interface) { :cli }

        it 'loads CLI interface' do
          is_expected.to eql Interfaces::CLI
        end
      end

      context 'when using File interface' do
        let(:interface) { :file }

        it 'loads File interface' do
          is_expected.to eql Interfaces::File
        end
      end

      context 'when loading an unkown interface' do
        let(:interface) { :unkown }

        it 'raises InvalidInitializationError' do
          expect { subject }.to raise_error Errors::InvalidInitializationError
        end
      end
    end
  end
end
