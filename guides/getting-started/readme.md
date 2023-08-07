# Getting Started

This guide explains how to integrate the `console-adapter-sidekiq` gem into your Sidekiq application.

## Installation

Add the gem to your project:

~~~ bash
$ bundle add console-adapter-sidekiq
~~~

## Update your Environment

To add this to an application that uses Sidekiq, update your sidekiq configuration file to include the following:

~~~ ruby
# Setup the console adapter for Sidekiq:
require 'console/adapter/sidekiq'
Console::Adapter::Sidekiq.apply!
~~~
