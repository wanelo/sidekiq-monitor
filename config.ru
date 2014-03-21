require 'rubygems'
require 'bundler/setup'

$:.unshift(File.expand_path('lib'))

require 'settingslogic'
require 'sidekiq'
require 'settings'

Sidekiq.configure_client do |config|
  config.redis = Settings.sidekiq
end

require 'sidekiq/web'
require 'sidekiq/pro/web'
run Sidekiq::Web
