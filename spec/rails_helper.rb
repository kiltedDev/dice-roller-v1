require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  
  config.after :each do
    Warden.test_reset!
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Warden::Test::Helpers
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
require "capybara/rails"
require "valid_attribute"

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
