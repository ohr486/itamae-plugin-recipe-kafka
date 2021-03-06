# Itamae::Plugin::Recipe::Kafka

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-kafka.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-kafka)
[![wercker status](https://app.wercker.com/status/d16fa27024405f7773d708eda82e5f61/m/master "wercker status")](https://app.wercker.com/project/byKey/d16fa27024405f7773d708eda82e5f61)

Itamae plugin to install kafka

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-kafka'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-kafka

## Usage

### Recipe

```ruby
# your recipe
include_recipe "kafka::install"
```

### Node

```yaml
# node.yml
scala:
  # target scala version
  # see: https://github.com/ohr486/itamae-plugin-recipe-scala
  version: 2.12.3

kafka:
  # target kafka version
  version: 1.0.0
  # target scala major.minor version
  kafka_scala_version: 2.12
  config:
    zookeeper:
      host: your.zookeeper.host
      port: 2181
    kafka:
      # kafka server config
      host-name1:
        id: 1
        host: your.kafka.host1
        port: 9091
      host-name2:
        id: 2
        host: your.kafka.host2
        port: 9092
      host-name3:
        id: 3
        host: your.kafka.host3
        port: 9093
      ...
```

## Testing

requirements [Vagrant](https://www.vagrantup.com/)

```sh
bundle exec rake itamae:default
bundle exec rake spec:default
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
