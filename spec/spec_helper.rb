

ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
# require 'rake'

Capybara.app = BookmarkManager

# Rake.application.load_rakefile


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    require_relative './test_database_setup'
  end
end
