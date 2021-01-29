# Itamae::Plugin::Recipe::BedrockServer

Itamae plugin to install [Minecraft](https://www.minecraft.net/) with init scripts.
You must read [Minecraft Server Download](https://www.minecraft.net/en-us/download/server/bedrock/)の[Minecraft End User License Agreement](https://account.mojang.com/terms) and [Privacy Policy](https://privacy.microsoft.com/ja-jp/privacystatement).

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-bedrock_server.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-bedrock_server)
![test](https://github.com/kyohah/itamae-plugin-recipe-bedrock_server/workflows/test/badge.svg)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
![](https://ruby-gem-downloads-badge.herokuapp.com/itamae-plugin-recipe-bedrock_server?type=total)

## Supported
* Ubuntu 18 or later

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

[default node.yml](https://github.com/kyohah/itamae-plugin-recipe-bedrock_server/blob/main/recipes/node.yml)

```yml
# node.yml
bedrock_server:
  # path to bedrock server directory (default: "/opt")
  app_dir: "/opt"

  # bedrock-server download url (defailt is check from https://minecraft.net/en-us/download/server/bedrock/ and detect latest url)
  url: "https://minecraft.azureedge.net/bin-linux/bedrock-server-1.16.201.02.zip"

  # bedrock_server service actions when after install (default: enable, start)
  service_actions:
    - enable
    - start
    # - disable
    # - stop

  # server.properties configuration
  configuration:
    server-name: "Dedicated Server"
    gamemode: "survival"
    difficulty: "easy"
    allow-cheats: false
    max-players: 10
    online-mode: true
    white-list: false
    server-port: 19132
    server-portv6: 19133
    view-distance: 32
    tick-distance: 4
    player-idle-timeout: 30
    max-threads: 8
    level-name: "Bedrock level"
    level-seed: ""
    level-type: "DEFAULT"
    default-player-permission-level: "member"
    texturepack-required: false
    content-log-file-enabled: false
    compression-threshold: 1
    server-authoritative-movement: "server-auth"
    player-movement-score-threshold: 20
    player-movement-distance-threshold: 0.3
    player-movement-duration-threshold-in-ms: 500
    correct-player-movement: false
```

## Development

```
    $ docker run --name tmp-ubuntu $IMAGE bash -c "apt-get update && apt-get install -y systemd-sysv"
    $ docker commit tmp-ubuntu ubuntu-with-systemd
    $ docker run --privileged -d -rm --name container-with-service ubuntu-with-systemd /sbin/init
    $ bundle exec itamae docker --node-yaml=recipes/node.yml recipes/install.rb --container=container-with-service
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyohah/itamae-plugin-recipe-bedrock_server. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kyohah/itamae-plugin-recipe-bedrock_server/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Itamae::Plugin::Recipe::BedrockServer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kyohah/itamae-plugin-recipe-bedrock_server/blob/master/CODE_OF_CONDUCT.md).
