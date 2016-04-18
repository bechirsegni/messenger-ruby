# messenger-ruby
[![](https://img.shields.io/gem/v/messenger-ruby.svg?style=flat-square)](https://rubygems.org/gems/messenger-ruby)
[![](https://img.shields.io/circleci/project/netguru/messenger-ruby.svg?style=flat-square)](https://circleci.com/gh/netguru/messenger-ruby)
[![](http://img.shields.io/codeclimate/github/netguru/messenger-ruby.svg?style=flat-square)](https://codeclimate.com/github/netguru/messenger-ruby)
[![](http://img.shields.io/codeclimate/coverage/github/netguru/messenger-ruby.svg?style=flat-square)](https://codeclimate.com/github/netguru/messenger-ruby)

A simple library for supporting implementation of Facebook Messenger Bots.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'messenger-ruby', git: 'https://github.com/netguru/messenger-ruby.git'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install messenger-ruby

## Configuration

Create `messenger.rb` initializer in you app directory:

```ruby
# YOUR_APP/config/initializers/messenger.rb
Messenger.configure do |config|
  config.verify_token      = '...'
  config.page_access_token = '...'
end
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/netguru/messenger-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
