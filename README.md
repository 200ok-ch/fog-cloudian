# Fog::Cloudian

This is a Fog API wrapper for the Cloudian Hyperstore REST APIs (Admin
& S3). For S3 this is just a shim for fog-aws.

Currently about 13% (10 out of 77 API calls) of the Admin API are
covered. Hence there is plenty of oppurtinityt for some FOSS
contribution here.

Also this library does not provide proper mock requests, yet. Which
means more opportunities to get you feet wet. ;)

## Installation

Add this line to your application's Gemfile:

```
gem 'fog-cloudian'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install fog-cloudian
```

## Usage

Before you can use fog-cloudian, you must require it in your application:

```ruby
require  'fog/cloudian'
```

### Connecting to Cloudian's Admin API

```ruby
config = {
    user: '[REDACTED]',
    password: '[REDACTED]',
    host: '[REDACTED]',
    port: 19443,
    ssl_verify_peer: true
}

cloudian = Fog::Cloudian::Admin.new(config)
```

You can review all the requests available with this service using #requests method:

```ruby
cloudian.requests # => [[nil, :create_group], [nil, :get_group], [nil, :delete_group], ...
```

## Contributing

1. Fork it ( https://github.com/200ok-ch/fog-cloudian/fork )
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Create a new Pull Request

## License

see [LICENSE.md](LICENSE.md)
