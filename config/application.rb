require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cra
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales','**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es
    config.i18n.enforce_available_locales = false  
  end
end
