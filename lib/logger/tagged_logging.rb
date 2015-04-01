require 'logger/syslogger'

module Abril
  module TaggedLogging
    include ActiveSupport::TaggedLogging

    def self.new(logger = nil)
      logger ||= ActiveSupport::TaggedLogging.new(Abril::Syslogger.new)
      Rails.application.config.log_tags = [:uuid]
      logger
    end
  end
end
