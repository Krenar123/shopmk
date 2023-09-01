# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Buymk
  class Application < Rails::Application
    config.time_zone = 'Europe/Skopje'
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Where the I18n library should search for translation files
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # Locales are supported by our app
    config.i18n.available_locales = %i[en mk sq]

    # Our default locale
    config.i18n.default_locale = :mk
    config.database_url = ENV['DATABASE_URL']
  end
end
