require 'logger/syslogger'

module Abril
  module TaggedSyslog
    include ActiveSupport::TaggedLogging

    def self.new(logger = nil)
      logger ||= ActiveSupport::TaggedLogging.new(Abril::Syslogger.new)
      binding.pry
      Rails.application.config.log_tags = [:uuid]
      logger
    end
  end
end
