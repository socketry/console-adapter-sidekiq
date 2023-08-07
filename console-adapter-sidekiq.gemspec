# frozen_string_literal: true

require_relative "lib/console/adapter/sidekiq/version"

Gem::Specification.new do |spec|
	spec.name = "console-adapter-sidekiq"
	spec.version = Console::Adapter::Sidekiq::VERSION
	
	spec.summary = "Adapt Sidekiq logs and events to the console gem."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/socketry/console-adapter-sidekiq"
	
	spec.files = Dir.glob(['{lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.0"
	
	spec.add_dependency "console", "~> 1.21"
	spec.add_dependency "sidekiq", ">= 6.0"
end
