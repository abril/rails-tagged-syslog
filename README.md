# rails-tagged-syslog
https://github.com/abril/rails-tagged-syslog

## Description
This is a simple wrapper to integrate Rails Tagged Logging with Syslog, this way you can benefit from rails tagged logging with
the power provided by the [syslog](http://en.wikipedia.org/wiki/Syslog) system.

## Install
````
$ gem install rails-tagged-syslog
````
or via Gemfile
```
gem 'rails-tagged-syslog'
```

## Usage

### Rails config
```ruby
config.logger = Abril::TaggedSyslog.new
```
By default it will add the request ID, as a tag, to your logs, but you can also add more tags using the default rails mechanism
```ruby
config.log_tags = [:remote_ip, -> request { request.env['yourapp.someid'] }]
```

### Syslog config

#### BSD Syslog Setup

##### /etc/syslog.conf

Add the following lines:
```
  !rails
  *.*                                             /var/log/production.log
```

Or, in Mac OS X:
```
  local7.*                                        /var/log/production.log
````

Then touch /var/log/production.log and signal syslogd with a HUP
```bash
$ killall -HUP syslogd
```

##### /etc/newsyslog.conf

Add the following line:
```
  /var/log/production.log                 640  7     *    @T00  Z
````

This creates a log file that is rotated every day at midnight, gzip'd, then
kept for 7 days.  Consult newsyslog.conf(5) for more details.

#### Syslog-ng Setup

##### syslog-ng.conf

A basic setup:
```
  destination rails_log { file("/var/log/production.log"); };
  filter f_rails { program("rails.*"); };
  log { source(src); filter(f_rails); destination(rails_log); };
````

A more advanced setup with formatting, etc:
```
  destination rails { file("/var/log/rails_apps" owner("rails") group("rails") perm(0664) template("$DATE $HOST $PROGRAM [$LEVEL] $MSGONLY\n") template_escape(no) ); };
  filter f_rails    { (program("railsappone") or program("railsapptwo")) and not match("SQL ") and not match("SELECT") and not match("INSERT INTO") and not match("UPDATE"); };
  log { source(src); filter(f_rails); destination(rails); };
````
