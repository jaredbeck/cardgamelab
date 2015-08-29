ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

if !Rails.env.test? || ENV.fetch("DATABASE_URL") !~ /cgl_test$/
  abort "Abort tests: invalid test environment"
end

require 'spec_helper'
require 'rspec/rails'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
