# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  module Interfaces
    RSpec.describe CLI do
      describe '#start' do
        subject { described_class.start(nil) }

        it 'raises an NotImplementedError' do
          expect { subject }.to raise_error NotImplementedError
        end
      end
    end
  end
end
