# Getting Started

This guide explains how to integrate the `console-adapter-sidekiq` gem into your Sidekiq application.

## Installation

Add the gem to your project:

~~~ bash
$ bundle add console
~~~

## Update your Environment

To add this to a Sidekiq application, update your `config/environment.rb` file:

~~~ ruby
# frozen_string_literal: true

# Load the Sidekiq application.
require_relative 'application'

# Setup the console adapter:
require 'console/adapter/sidekiq'
Console::Adapter::Sidekiq.apply!

# Initialize the Sidekiq application.
Sidekiq.application.initialize!
~~~
