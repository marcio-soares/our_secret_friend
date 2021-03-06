require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OurSecretFriend
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :sidekiq
    
    # config.time_zone = 'Brasilia'
    # config.encoding = "UTF-8"
    # config.i18n.default_locale = 'pt-BR'
    # config.action_mailer.default_options = {
    #   charset:       "UTF-8",
    #   content_type: "text/html"    
    # }        
  end
end
