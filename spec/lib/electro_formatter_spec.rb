require 'ostruct'
require 'spec_helper'

describe Arghspec::ElectroFormatter do
  let(:formatter) { Arghspec::ElectroFormatter.new(output_stream) }
  let(:ifkit) { instance_double('Phidgets::InterfaceKit', outputs: [ifkit_output]) }
  let(:notification) { OpenStruct.new(failure_notifications: failure_notifications) }
  let(:output) { output_stream.string }
  let(:output_stream) { StringIO.new }
  let(:ifkit_output) { instance_double('Output', :state= => nil) }

  before { allow(Phidgets::InterfaceKit).to receive(:new).and_yield(ifkit) }

  describe '#dump_failures' do

    context 'upon success' do
      let(:failure_notifications) { [] }

      it 'writes nothing to the output' do
        expect{formatter.dump_failures(notification)}.not_to change{output}
      end
    end

    context 'upon success' do
      let(:failure_notifications) { ['a failure'] }

      it 'writes the failure to the output' do
        expect{formatter.dump_failures(notification)}.to change{output}
      end

      it 'electrocutes the user' do
        formatter.dump_failures(notification)
        expect(ifkit_output).to have_received(:state=).with(true)
        expect(ifkit_output).to have_received(:state=).with(false)
      end
    end
  end
end
