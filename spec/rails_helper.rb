require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'factory_bot_rails'

# check for migration
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end


RSpec.configure do |config|
  config.use_transactional_fixtures = true

  config.filter_rails_from_backtrace!

  # Factorybot.create -> create
  config.include FactoryBot::Syntax::Methods
end
