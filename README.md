# Vero

A Ruby API client to [https://www.getvero.com](https://www.getvero.com).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vero-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vero-ruby

## Usage

You need to first set your Auth Token to authorize the requests. You Auth Token can be found in your [project settings](https://app.getvero.com/settings/project).

```ruby
Vero.auth_token = ENV['VERO_AUTH_TOKEN']
```

Then you can identify new customers

```ruby
Vero::Customers.identify({
  id: 123,
  email: 'damienb@getvero.com',
  first_name: 'damien',
  last_name: 'brzoska'
})
```

Or track events

```ruby
Vero::Events.track({
  user_id: 123,
  event: 'purchase item',
  item: {
    name: 'SodaStream',
    sku: 'ss-white-bamboo',
    price: '14900',
    url: 'https://www.sodastream.com/p/ss-white-bamboo'
  }
})
```

## Other APIs

To view all API calls available, please visit our [developer documentation](https://developers.getvero.com/?ruby)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

