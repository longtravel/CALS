# config/initializers/session_store.rb
RailsWebpacker::Application.config.session_store :redis_store, {
  servers: [
    {
      host: ENV['REDIS_SERVER_HOST'],
      port: 6379,
      db: 0,
      namespace: "cals:session"
    }
  ],
  expire_after: 60.minutes
}
