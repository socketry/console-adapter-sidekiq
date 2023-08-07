# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'sidekiq'

require_relative 'sidekiq/error_handler'
require_relative 'sidekiq/logger'

module Console
	module Adapter
		module Sidekiq
			def self.apply!
				if ::Sidekiq.respond_to?(:default_configuration)
					# Sidekiq 7+
					::Sidekiq.default_configuration.logger = Logger.new(::Sidekiq)
					::Sidekiq.default_configuration[:error_handlers] = [ErrorHandler]
				else
					# Sidekiq < 7
					::Sidekiq.logger = Logger.new(::Sidekiq)
					::Sidekiq.error_handlers << ErrorHandler
				end
			end
		end
	end
end
