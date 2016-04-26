require 'phidgets-ffi'
require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

class Arghspec::ElectroFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :dump_failures

  DEFAULT_PULSE_DURATION_S = 0.1

  def initialize(output)
    @output = output
    @pulse_duration_s = 1
  end

  def initialize(output, options={})
    @output = output
    @pulse_duration_s = options.fetch(:pulse_duration_s, DEFAULT_PULSE_DURATION_S)
  end

  def dump_failures(notification)
    super(notification)
    electrocute_user unless notification.failure_notifications.empty?
  end

  private

  def electrocute_user
    Phidgets::InterfaceKit.new do |ifkit|
      ifkit.outputs[0].state = true
      sleep(@pulse_duration_s)
      ifkit.outputs[0].state = false
    end
  end
end
