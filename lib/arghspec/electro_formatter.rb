require 'phidgets-ffi'
require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

class Arghspec::ElectroFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :dump_failures

  def initialize(output)
    @output = output
  end

  def dump_failures(notification)
    super(notification)
    electrocute_user unless notification.failure_notifications.empty?
  end

  private

  def electrocute_user
    Phidgets::InterfaceKit.new do |ifkit|
      ifkit.outputs[0].state = true
      sleep(1)
      ifkit.outputs[0].state = false
    end
  end
end

