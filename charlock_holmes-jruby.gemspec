# encoding: utf-8

require './lib/charlock_holmes/version' unless defined? CharlockHolmes::VERSION

Gem::Specification.new do |s|
  s.name = %q{charlock_holmes-jruby}
  s.version = CharlockHolmes::VERSION
  s.platform = 'java'
  s.authors = ["Francis Chong"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")
  s.email = %q{francis@ignition.hk}

  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/siuying/charlock_holmes-jruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.4.2}
  s.summary = %q{Character encoding detection, brought to you by ICU.}
  s.description = %q{JRuby compatible ICU encoding detection build on top of ICU4J.}
  s.test_files = `git ls-files spec`.split("\n")

  s.add_development_dependency 'rake-compiler', ">= 0.7.5"
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end