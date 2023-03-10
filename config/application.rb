# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CodingExampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.log_level = :debug
    config.log_tags  = %i[subdomain uuid]
    config.logger    = ActiveSupport::TaggedLogging.new(Logger.new($stdout))

    config.cache_store = :redis_cache_store, { url: ENV.fetch('CACHE_URL', nil) }
    config.session_store :redis_session_store,
                          key: 'your_session_key',
                          redis: {
                            expire_after: 120.minutes,  # cookie expiration
                            ttl: 120.minutes,           # Redis expiration, defaults to 'expire_after'
                            key_prefix: 'myapp:session:',
                            url: ENV.fetch('CACHE_URL', nil),
                          }
    config.active_job.queue_adapter = :sidekiq
  end
end
