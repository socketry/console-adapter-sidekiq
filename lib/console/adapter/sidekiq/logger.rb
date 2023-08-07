# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'console'
require 'console/compatible/logger'
require 'sidekiq'

module Console
	module Adapter
		module Sidekiq
			# An output wrapper that adds Sidekiq context to the output.
			class Wrapper
				def initialize(output)
					@output = output
				end

				def call(*arguments, **options, &block)
					if (context = ::Sidekiq::Context.current)
						options.update(context)
					end

					@output.call(*arguments, **options, &block)
				end
			end
			
			# A compatible logger for sidekiq that prevents monkey patching.
			class Logger < Console::Compatible::Logger
				def initialize(subject, output = Console)
					super(subject, Wrapper.new(output))
				end

				# Prevent Sidekiq from messing with internal behaviour.
				# see: https://github.com/mperham/sidekiq/blob/v6.5.8/lib/sidekiq.rb#L285
				def extend(*args); end
			end
		end
	end
end