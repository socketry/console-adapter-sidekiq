# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'app'

require 'console/adapter/sidekiq'
require 'console/capture'

describe Sidekiq do
	let(:capture) {Console::Capture.new}
	let(:logger) {Console::Logger.new(capture)}
	
	it "can log messages" do
		Fiber.new do
			Console.logger = logger
			Sidekiq.logger.info("Hello World")
		end.resume
		
		expect(capture).to be(:include?, "Hello World")
	end
end
