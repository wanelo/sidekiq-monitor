Sidekiq Monitor
===============

This project wraps up the Sidekiq Monitor Sinatra server that ship
with Sidekiq so that you can run in separately from you publishing
application.

By default, you need to run Sidekiq Monitor out of your application
code. This means that you either need to run Sidekiq Monitor on an
application or Sidekiq server, or you need to ship your application
code onto servers that otherwise do not need it.

This small wrapper takes minimal configuration to connect to an
arbitrary redis server and show your Sidekiq stats.

## Requirements

* A Ruby runtime environment
* Bundler

## Usage

* Create or decide on a user with which to run the service
* Create a log directory in `/var/log/sidekiq-monitor` in which unicorn
  logs will be written
* Ensure that the deployment user has write access to the log dir
* Create a pid dir in `/var/run/sidekiq-monitor`
* Ensure that the deployment user has write access to the pid dir
* Check out Sidekiq Monitor into a directory as the deployment user
  and install bunlded gems

```bash
git clone https://github.com/wanelo/sidekiq-monitor
pushd sidekiq_monitor
bundle install --path ~/.sidekiq-monitor-bundle
```

* Create a config file pointing to the redis used by your Sidekiq
  processes

```bash
cp config/config.yml.example config/config.yml
```

* Edit config.yml with your particular settings
* Run Unicorn in the service manager of your choice

```bash
bundle exec unicorn -c /path/to/sidekiq-monitor/config/unicorn.rb -D /path/to/sidekiq-monitor/config.ru
```


