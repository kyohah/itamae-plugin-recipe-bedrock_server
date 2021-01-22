# Itamae::Plugin::Recipe::BedrockServer

Itamae plugin to install [Minecraft](https://www.minecraft.net/) with init scripts

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-bedrock_server.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-bedrock_server)
![test](https://github.com/kyohah/itamae-plugin-recipe-bedrock_server/workflows/test/badge.svg)

## Supported
* Ubuntu 18 or later [^1]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-bedrock_server'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-bedrock_server

## Usage

### Recipe

Install bedrock_server executable file and init scritps (systemd or init.d)

```ruby
# recipe.rb
include_recipe "bedrock_server"
```

Or `include_recipe` just what you need manually:

```ruby
include_recipe "bedrock_server::setup"
include_recipe "bedrock_server::install"
include_recipe "bedrock_server::service"
```

### Node

```yml
# node.yml
bedrock_server:
  # path to downloaded zip file (default: "/opt")
  app_dir: "/opt"

  # start environment (default: ".")
  ld_library_path: "."

  # bedrock_server service actions when after install (default: enable, start)
  service_actions:
    - enable
    - start
    # - disable
    # - stop
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyohah/itamae-plugin-recipe-bedrock_server.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[^1]: bedrock-server-1.16.201.02/bedrock_server_how_to.html
