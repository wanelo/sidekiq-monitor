worker_processes 4

# nuke workers after 30 seconds instead of 60 seconds (the default)
timeout 30

# feel free to point this anywhere accessible on the filesystem
pid "/var/run/sidekiq-monitor.pid"

# By default, the Unicorn logger will write to stderr.
# Additionally, ome applications/frameworks log to stderr or stdout,
# so prevent them from going to /dev/null when daemonized here:
stderr_path '/var/log/sidekiq-monitor/unicorn.stderr.log'
stdout_path '/var/log/sidekiq-monitor/unicorn.stdout.log'

# combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
GC.respond_to?(:copy_on_write_friendly=) and GC.copy_on_write_friendly = true
GC::Profiler.enable

after_fork do |server, worker|
  # force rand to be different for each unicorn child worker
  srand(Time.now.to_i * Process.pid)
end
