module Abril
  module TaggedSyslog
    class Railtie < Rails::Railtie
      # force uuid to be logged
      config.after_initialize do |app|
        if app.config.log_tags
          app.config.log_tags.unshift(:uuid) unless app.config.log_tags.include? :uuid
        else
          app.config.log_tags = [:uuid]
        end
      end
    end
  end
end