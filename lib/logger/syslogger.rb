require 'logger/formatter'

module Abril
  class Syslogger < Logger::Syslog
    def initialize(app_name = nil)
      app_name ||= Rails.application.class.to_s.split('::').first
      super(app_name, Syslog::LOG_LOCAL7)
      @formatter = Abril::Formatter.new
      @progname = app_name
      Logger::Syslog.const_set :SYSLOG, self.class::SYSLOG
    end
  end
end
