module Abril
  module TaggedSyslog
    class Railtie < Rails::Railtie
      config.after_initialize do
        binding.pry
        return unless config.log_tags
        config.log_tags.push(:uuid) unless app.config.log_tags.include? :uuid
      end
    end
  end
end