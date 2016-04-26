require 'messenger-ruby'
require "codeclimate-test-reporter"

ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../test_app/config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'webmock/rspec'

WebMock.disable_net_connect!(:allow => "codeclimate.com")

CodeClimate::TestReporter.start
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
