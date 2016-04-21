# messenger-ruby
[![](https://img.shields.io/gem/v/messenger-ruby.svg?style=flat-square)](https://rubygems.org/gems/messenger-ruby)
[![](https://img.shields.io/circleci/project/netguru/messenger-ruby.svg?style=flat-square)](https://circleci.com/gh/netguru/messenger-ruby)
[![](http://img.shields.io/codeclimate/github/netguru/messenger-ruby.svg?style=flat-square)](https://codeclimate.com/github/netguru/messenger-ruby)
[![](http://img.shields.io/codeclimate/coverage/github/netguru/messenger-ruby.svg?style=flat-square)](https://codeclimate.com/github/netguru/messenger-ruby)

A simple library for supporting implementation of Facebook Messenger Bots.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'messenger-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install messenger-ruby

## Configuration

#### Facebook steps

* [create Facebook page](https://www.facebook.com/pages/create/) (skip if you want to use existing page)
* [create Facebook app](https://developers.facebook.com/quickstarts/?platform=web) (skip if you want to use existing app)
* go to [Facebook for Developers](https://developers.facebook.com/apps/) and get Page Access Token (step __3. Get Page Access Token__ from [this tutorial](https://developers.facebook.com/docs/messenger-platform/quickstart#steps]))

#### Initializer

Create `messenger.rb` initializer in you app directory and paste Page Access Token from previous step:

```ruby
# YOUR_APP/config/initializers/messenger.rb
Messenger.configure do |config|
  config.verify_token      = '<VERIFY_TOKEN>' #it will be used in webhook verifiction
  config.page_access_token = '<PAGE_ACCESS_TOKEN>'
end
```

#### Routes

Add to your `routes.rb`:

```ruby
# YOUR_APP/config/routes.rb
mount Messenger::Engine, at: "/messenger"

```

#### Controller

Create `messenger_controller.rb` in your controllers directory - controller has to inherit from `Messenger::MessengerController`:

```ruby
# YOUR_APP/app/controllers/messenger_controller.rb
class MessengerController < Messenger::MessengerController
  def webhook
    #logic here
    render nothing: true, status: 200
  end
end
```

`2XX` status is necessary to not clog your bot.

If you want your controller to be named differently, please update your `routes.rb` with appropriate route for `post /messenger/webhook` request.

#### Bot subscription

Run your application and:
* complete step __2. Setup Webhook__ from [this tutorial](https://developers.facebook.com/docs/messenger-platform/quickstart#steps) - _if you mounted `Messenger::Engine` at `/messenger` and your application can be found at `https://example.com`, your `Callback URL` will be `https://example.com/messenger/webhook`_
* visit `/messenger/subscribe` in your app (it's replacement for __[4. Subscribe the App to the Page](https://developers.facebook.com/docs/messenger-platform/quickstart#steps)__ step) - call `subscribe` action anytime you want to refresh subscription of your app

## Usage

### Messenger::Request

It's used to build parameters for Facebook API. Requires [component](#components) and `recipient_id`.

Example usage:
```ruby
Messenger::Request.new(some_component, recipient_id)
```

### Messenger::Client

Sends requests to Facebook API. Has to methods:
* `get_user_profile` - requires id of existing facebook user
* `send` - requires [Messenger::Request](#messengerrequest) object

Example usage:
```ruby
Messenger::Client.get_user_profile(user_id) #=> hash with name, surname and profile picture
Messenger::Client.send(request) #=> hash with message details or exception if request is incorrect
```

Please note that unsuccessful `send` will be shown in logs as `Facebook API response from invalid request: ...`

### Elements

Elements can't be used outside of templates.

#### Button

Lives inside [Bubble](#bubble) element or [Button template](#button-template). It requires `type`, `title` and `value`.
Allowed types: `"web_url"` and `"postback"`.

Example usage:
```ruby
Messenger::Elements::Button.new(type: "web_url", title: "Button", value: "http://github.com")
```

#### Bubble

Part of [Generic template](#button-template). Requires `title` and at least one attribute from `subtitle`, `image_ul` and `buttons`. Optional argument: `item_url`

`buttons` - Array of [`Messenger::Elements::Button`](#button) objects.

Example usage:
```ruby
Messenger::Elements::Bubble.new(title: "First", subtitle: "Bubble")

```

#### Address

Used by [Receipt template](#receipt-template).

Example usage:
```ruby
Messenger::Elements::Address.new(street_1: 'Vachel Lindsay Dr', street_2: "", city: "Springfield", postal_code: '62701', state: 'IL', country:'USA')
```

#### Adjustment

Used by [Receipt template](#receipt-template).

Example usage:
```ruby
```

#### Item

Used by [Receipt template](#receipt-template).

Example usage:
```ruby
```

#### Order

Used by [Receipt template](#receipt-template).

Example usage:
```ruby
```

#### Summary

Used by [Receipt template](#receipt-template).

Example usage:
```ruby
```

### Components

#### Text

Here is complete example on how to send sample text to the user:
```ruby
fb_params = Messenger::Params.new(params)
if fb_params.message?
  Messenger::Client.send(
    Messenger::Request.new(
      Messenger::Elements::Text.new(text: "some text"),
      fb_params.sender_id
    )
  )
end

#make sure to send 200 at the end
render nothing: true, status: 200
```

#### Image

Sending images is simple as well:
```ruby
...
Messenger::Client.send(
  Messenger::Request.new(
    Messenger::Elements::Image.new(url: 'http://lorempixel.com/400/400/cats'),
    fb_params.sender_id
  )
)
...
```

#### Generic template

#### Button template

#### Receipt template

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `rake console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/netguru/messenger-ruby.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
