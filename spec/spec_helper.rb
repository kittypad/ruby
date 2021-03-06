# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

module ControllerMacros
  def login_admin
    # before(:each) do
    #      @request.env["devise.mapping"] = Devise.mappings[:admin]
    #      sign_in Factory.create(:admin)
    #    end
  end

  def login_parent
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:parent]
      @parent = Factory.create(:parent)
      sign_in @parent
    end
  end
  
end


RSpec.configure do |config|
  config.mock_with :mocha

  config.include Devise::TestHelpers, :type => :controller
  # config.extend ControllerMacros, :type => :controller

  config.use_transactional_fixtures = false
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
  
  config.extend ControllerMacros, :type => :controller
end


