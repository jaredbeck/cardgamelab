require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module CGL
  class Application < Rails::Application
    config.time_zone = 'UTC'
    config.i18n.default_locale = :en
  end
end
