# StiFallback

Imagine you're using [STI](https://api.rubyonrails.org/classes/ActiveRecord/Inheritance.html) and getting a `type` column from your users. You want to validate that the type is one of the expected values instead of letting ActiveRecord raise an error when the subclass is not found.

This can be achieved by defining a validation rule on the base mode and falling back to it when the subclass is not found. 

This gem provides a simple way to do that.

## Usage

```ruby
class Action < ApplicationRecord
  include StiFallback
  
  validates :type, inclusion: { in: %w[Value1 Value2 Value3] }

  # optional: still raise an error when the following subclasses are not found
  # sti_fallback raise_error_for: %w[Value1 Value2]
end
```

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add sti_fallback

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install sti_fallback

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/osbre/sti_fallback.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
