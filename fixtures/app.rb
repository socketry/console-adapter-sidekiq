# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'sidekiq'
require_relative '../lib/console/adapter/sidekiq'

Console::Adapter::Sidekiq.apply!

