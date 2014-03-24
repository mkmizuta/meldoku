require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Meldoku
  class Application < Rails::Application

    config.assets.enabled = true
    config.assets.initialize_on_precompile = false


    config.assets.precompile += ['application.css', 'page_views.js']

# Not required, but a good best-practice for performance.
# This setting will compress your assets as much as possible using YUI and Uglifier by default
    config.assets.compress = true

# Allow fingerprinting of asset filenames - good for caching.
    config.assets.digest = true

# Configure the sendfile headers for Heroku.  "X-Accel-Redirect" is also a good value for this since Heroku use Nginx.
    config.action_dispatch.x_sendfile_header = nil
   
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
