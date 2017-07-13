require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# config.assets.initialize_on_precompile = false

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bike_Berlin
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # config/application.rb
    config.cache_store = :redis_store, "redis://localhost:6379/0/cache"
    # , { expires_in: 90.minutes }

    # Don't generate system test files.
    config.generators.system_tests = nil

    config.generators do |g|
      g.factory_girl dir: 'spec/factories'
    end    

    # The code opens the config/local_env.yml file, reads each key/value pair, and sets environment variables.

    # The code only runs if the file exists. If the file exists, the code 
    # overrides ENV variables set in the Unix shell. If you prefer to set 
    # environment variables in the Unix shell, don’t create the config/local_env.yml file.    
    # config.before_configuration do
    #   env_file = File.join(Rails.root, 'config', 'local_env.yml')
    #   YAML.load(File.open(env_file)).each do |key, value|
    #     ENV[key.to_s] = value
    #   end if File.exists?(env_file)
    # end       

  end
end

    # ActionDispatch::Callbacks.after do      
    #   # Reload the factories
    #   return unless (Rails.env.development? || Rails.env.test?)
      
    #   unless FactoryGirl.factories.blank? # first init will load factories, this should only run on subsequent reloads
    #     FactoryGirl.factories.clear
    #     FactoryGirl.find_definitions
    #   end

    # end 

 

