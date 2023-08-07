# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'console'
require 'sidekiq'

module Console
	module Adapter
		module Sidekiq
			# Custom error handler for Sidekiq.
			ErrorHandler = lambda do |exception, context|
				job = context[:job] || {}
				Console.error(::Sidekiq, exception, **job)
			end
		end
	end
end