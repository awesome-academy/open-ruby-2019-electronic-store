require_relative 'boot'

require "rails/all"

Bundler.require(*Rails.groups)

module OpenRuby2019ElectronicStore
  class Application < Rails::Application
    config.load_defaults 6.0
    config.generators.system_tests = nil
    config.i18n.default_locale = :en
    config.time_zone = Settings.time_zone
  end
end
