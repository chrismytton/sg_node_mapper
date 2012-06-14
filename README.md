# SgNodeMapper

[![Build Status](https://secure.travis-ci.org/hecticjeff/sg_node_mapper.png?branch=master)](http://travis-ci.org/hecticjeff/sg_node_mapper)

Lightweight ruby wrapper around the Social Graph Node Mapper [javascript
library](https://github.com/webjay/sgNodeMapper).

## Installation

Add this line to your application's Gemfile:

    gem 'sg_node_mapper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sg_node_mapper

## Usage

This library simply delegates to the javascript library, so you can call
any methods defined in there (see `vendor/sg_node_mapper/nodemapper.js` for more details.

```ruby
SgNodeMapper.url_to_graph_node('http://twitter.com/hecticjeff')
# => "sgn://twitter.com/?ident=hecticjeff"

SgNodeMapper.parse_sgn_url('sgn://twitter.com/?ident=hecticjeff')
# => {"domain"=>"twitter.com", "keyName"=>"ident", "value"=>"hecticjeff"}
``` 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
