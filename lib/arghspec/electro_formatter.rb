require 'rspec'
require 'rspec/core/formatters/base_text_formatter'

class Arghspec::ElectroFormatter < RSpec::Core::Formatters::BaseTextFormatter
  RSpec::Core::Formatters.register self, :dump_failures

  def initialize(output)
    @output = output
  end

  def dump_failures(notification)
    super(notification)
    electrocute_user
  end

  private

  def electrocute_user
    # TODO: zap the user
  end
end

