[![Circle CI](https://circleci.com/gh/gohiring/xero.svg?style=svg&circle-token=ec8f29a58a76aed94881f13e756888ec9aafc762)](https://circleci.com/gh/gohiring/xero)

# Xero

ActiveModel compliant library for talking with the Xero API

## Installation

Add this line to your application's Gemfile:

    gem 'xero'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install xero

## Usage

    client = Xero::Clients::PrivateApplication.new
    contacts = client.contacts
    invoices = client.invoices
    items = client.items

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
