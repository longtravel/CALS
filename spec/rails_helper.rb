ENV['RAILS_ENV'] = 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'

# Add additional requires below this line. Rails is not loaded until this point!
# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
#ActiveRecord::Migration.maintain_test_schema!

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f }

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.javascript_driver = :selenium_chrome
 Capybara.run_server = true
Capybara.app_host = "http://localhost:5000"
RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # VCR Config
  unless ENV['DISABLE_VCR']
    config.around(:each) do |example|
      options = example.metadata[:vcr] || {}
      if options[:record] == :skip
        VCR.turned_off(&example)
      else
        name = example.metadata[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/\./, '/').gsub(/[^\w\/]+/, '_').gsub(/\/$/, '')
        VCR.use_cassette(name, options, &example)
      end
    end
  end

#
  ## WebMock.allow_net_connect!

#  config.before(:suite) do
#    DatabaseCleaner.clean_with(:truncation)
#  end

#  config.before(:each) do
#    DatabaseCleaner.strategy = :transaction
#  end

#  config.before(:each, js: true) do
#    DatabaseCleaner.strategy = :truncation
#  end

  # This block must be here, do not combine with the other `before(:each)` block.
  # This makes it so Capybara can see the database.
#  config.before(:each) do
#    DatabaseCleaner.start
#  end

#  config.after(:each) do
#    DatabaseCleaner.clean
#  end
end
