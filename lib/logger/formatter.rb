module Abril
  class Formatter < Logger::SyslogFormatter
    def call(severity, _timestamp, _progname, msg)
      sprintf("[%s] %s\n", severity, msg2str("#{msg}"))
    end
  end
end
