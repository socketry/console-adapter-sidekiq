# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'app'

describe Sidekiq do
	it "has registered error handler" do
		skip_unless_method_defined(:default_configuration, Sidekiq.singleton_class)
		
		expect(Sidekiq.default_configuration.error_handlers).to be(:include?, Console::Adapter::Sidekiq::ErrorHandler)
	end
	
	it "has registered error handler" do
		skip_unless_method_defined(:error_handlers, Sidekiq.singleton_class)
		
		expect(Sidekiq.error_handlers).to be(:include?, Console::Adapter::Sidekiq::ErrorHandler)
	end
end
