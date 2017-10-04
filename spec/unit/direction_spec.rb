# frozen_string_literal: true

require 'spec_helper'

module AwesomeToyRobotSimulator
  RSpec.describe Direction do
    let(:instance) { described_class.new(name) }
    let(:name) { 'north' }
    let(:cardinal_direction) { double(:north) }

    before do
      allow(CardinalDirectionFactory).to receive(:call)
        .and_return(cardinal_direction)
    end

    describe('.initialize') do
      subject { instance }

      it 'loads the correct cardinal_direction from the passed in name' do
        subject

        expect(CardinalDirectionFactory).to have_received(:call).with(name: name)
      end
    end

    describe '.left' do
      subject { instance.left }

      let(:new_cardinal_direction) { double(:new_cardinal_direction) }

      before do
        allow(cardinal_direction).to receive(:left)
          .and_return(new_cardinal_direction)
      end

      it 'delegates to cardinal_direction#left' do
        subject

        expect(cardinal_direction).to have_received(:left)
      end

      it 'returns same instance' do
        is_expected.to eql instance
      end
    end

    describe '.right' do
      subject { instance.right }

      let(:new_cardinal_direction) { double(:new_cardinal_direction) }

      before do
        allow(cardinal_direction).to receive(:right)
          .and_return(new_cardinal_direction)
      end

      it 'delegates to cardinal_direction#right' do
        subject

        expect(cardinal_direction).to have_received(:right)
      end

      it 'returns same instance' do
        is_expected.to eql instance
      end
    end

    describe '.step_forward' do
      subject { instance.step_forward(position) }

      let(:position) { instance_double(Position) }
      let(:new_position) { instance_double(Position) }

      before do
        allow(cardinal_direction).to receive(:step_forward)
          .and_return(new_position)
      end

      it 'delegates to cardinal_direction#step_forward' do
        subject

        expect(cardinal_direction).to have_received(:step_forward).with(position)
      end

      it 'returns a new Position object' do
        is_expected.to eql new_position
      end
    end

    describe '.to_s' do
      subject { instance.to_s }

      before do
        allow(cardinal_direction).to receive(:name)
          .and_return('Directions::North')
      end

      it 'returns the correct cordinate upcased name' do
        is_expected.to eql 'NORTH'
      end
    end
  end
end
