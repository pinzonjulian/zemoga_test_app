require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ZemogaTestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    $twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ZemogaTestApp::Application.secrets[:CONSUMER_KEY]  #"YOUR_CONSUMER_KEY"
      config.consumer_secret     = ZemogaTestApp::Application.secrets[:CONSUMER_SECRET]  #"YOUR_CONSUMER_SECRET"
      config.access_token        = ZemogaTestApp::Application.secrets[:ACCESS_TOKEN]  #"YOUR_ACCESS_TOKEN"
      config.access_token_secret = ZemogaTestApp::Application.secrets[:ACCESS_SECRET]  #"YOUR_ACCESS_SECRET"
    end

  end
end
