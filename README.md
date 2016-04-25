# arghspec

Momentarily sets a [Phidget I/O board](http://www.phidgets.com/products.php?product_id=1018) output to high when tests fail; this can be used to build an Electrocution Driven Development rig.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'arghspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install arghspec

## Usage

`rspec --format Arghspec::ElectroFormatter`

... or specify the default formatter in your configuration (usually in `spec_helper.rb`):

    require 'arghspec'
    RSpec.configure do |config|
      config.formatter = Arghspec::ElectroFormatter
    end

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/duncan-bayne/arghspec.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

