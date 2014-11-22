#Sidetiq.logger = Logger.new(STDOUT)

Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://127.0.0.1:6379/0', :namespace => "sidekiq-#{Rails.env}", :size => 14 }
end

Sidekiq.configure_client do |config|
  config.redis = { :url => 'redis://127.0.0.1:6379/0', :namespace => "sidekiq-#{Rails.env}", :size => 3  }
end

# Require all existing scheduled jobs
Dir[Rails.root.join "app/workers/*.rb"].each { |f| require f }