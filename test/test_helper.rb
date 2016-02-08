ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'database_cleaner'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  ActiveRecord::Migration.check_pending!
  DatabaseCleaner.strategy = :truncation
  setup { DatabaseCleaner.start }
  teardown { DatabaseCleaner.clean }
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Assertions
end