require 'logger/syslogger'

module Abril
  module TaggedSyslog
    include ActiveSupport::TaggedLogging

    def self.new(logger = nil)
      logger ||= ActiveSupport::TaggedLogging.new(Abril::Syslogger.new)
      logger
    end
  end
end
