# autohash [![Build Status](https://travis-ci.org/jleeothon/autohash.svg?branch=master)](https://travis-ci.org/jleeothon/autohash)

The gem introduces Hashes with automatic keys based on their values in Ruby. It behaves very similar to sets, but are more predictable because you can define your own value to use as a key.

For example:

```
require 'autohash'

class Dog
  attr_accessor :name
  def initialize name
    @name = name
  end
end

dogs = AutoHash.new(Dog) do |d|
  d.name
end

dogs << Dog.new("Pulgas")
dogs << Dog.new("Gijs")
dogs << Dog.new("Pulgas") # replaces the previous Pulgas
```

This class directly extends `Hash`, so all other methods are available. The only the `<<` method is added.
