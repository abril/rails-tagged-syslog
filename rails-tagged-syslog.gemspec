require File.expand_path('../lib/logger/version', __FILE__)

Gem::Specification.new do |s|
  s.name = %q{rails-tagged-syslog}
  s.version = Abril::TaggedSyslog::VERSION
  s.authors = ["Giuliano Melo"]
  s.license = "GPLv2"
  s.email = %q{giuliano.melo@abril.com.br}
  s.homepage = %q{http://github.com/abril/rails-tagged-syslog}
  s.rdoc_options = ["--charset=UTF-8"]
  s.summary = %q{A simple wrapper to use Rails Tagged Logging with Syslog}

  # s.files = `git ls-files`.split('\n')
  s.files = `git ls-files README.md CHANGELOG.md LICENSE lib`.split

  s.add_dependency 'syslog-logger'
end