require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

# In local development, load from e.g. environments/test.env and .env
# http://devblog.avdi.org/2014/01/17/dotenv-for-multiple-environments/
if Rails.env.development? || Rails.env.test?
  Dotenv.overload(
    File.expand_path("../environments/#{Rails.env}.env", __FILE__),
    File.expand_path("../../.env", __FILE__)
  )
end

module CGL
  class Application < Rails::Application
    config.time_zone = 'UTC'
    config.i18n.default_locale = :en
  end
end
