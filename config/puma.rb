# https://github.com/puma/puma/blob/master/examples/config.rb

pidfile "/var/run/sidekiq-monitor/#{ENV['PID_FILE_NAME'] || 'puma.pid'}"
stdout_redirect "/var/log/sidekiq-monitor/#{ENV['STDERR_FILE_NAME'] || 'puma.stderr.log'}",
                "/var/log/sidekiq-monitor/#{ENV['STDOUT_FILE_NAME'] || 'puma.stdout.log'}", true

threads 0, 3
workers 0
