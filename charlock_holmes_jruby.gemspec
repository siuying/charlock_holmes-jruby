# encoding: utf-8

require './lib/charlock_holmes/version' unless defined? CharlockHolmes::VERSION

Gem::Specification.new do |s|
  s.name = %q{charlock_holmes_jruby}
  s.version = CharlockHolmes::VERSION
  s.authors = ["Francis Chong"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.email = %q{francis@ignition.hk}
  s.extensions = ["ext/charlock_holmes/extconf.rb"]
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/siuying/charlock_holmes_jruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Character encoding detection, brought to you by ICU.}
  s.test_files = `git ls-files spec`.split("\n")

  # tests
  s.add_development_dependency 'rake-compiler', ">= 0.7.5"
  s.add_development_dependency 'rspec'

  # benchmarks
  # s.add_development_dependency 'chardet'
end