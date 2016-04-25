require 'ostruct'
require 'spec_helper'

describe Arghspec::ElectroFormatter do
  subject { Arghspec::ElectroFormatter.new(output_stream) }
  let(:notification) { OpenStruct.new(failure_notifications: failure_notifications) }
  let(:output) { output_stream.string }
  let(:output_stream) { StringIO.new }

  describe '#dump_failures' do

    context 'upon success' do
      let(:failure_notifications) { [] }

      it 'writes nothing to the output' do
        expect{subject.dump_failures(notification)}.not_to change{output}
      end
    end
  end
end
