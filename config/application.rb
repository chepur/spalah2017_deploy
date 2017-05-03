require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module Shop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.active_record.observers = :comment_observer
    config.active_job.queue_adapter = :sidekiq

    config.autoload_paths += %W(#{config.root}/app/policy)
    config.autoload_paths += %W(#{config.root}/app/forms)
    config.autoload_paths += %W(#{config.root}/app/services)
    config.autoload_paths += %W(#{config.root}/app/commands)
    config.paths.add File.join('app', 'mobile_api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'mobile_api', '*')]

    config.i18n.default_locale = :ru
  end
end
