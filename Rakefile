$LOAD_PATH << 'lib'

require 'rake/testtask'
require 'charlock_holmes/version'

task :package do
  version_string = "v#{CharlockHolmes::VERSION}"
  system %(gem build charlock_holmes-jruby.gemspec)
end

task :release => :package do
  version_string = "v#{CharlockHolmes::VERSION}"
  unless %x(git tag -l).include?(version_string)
    system %(git tag -a #{version_string} -m #{version_string})
  end
  system %(gem push charlock_holmes-jruby-*.gem && mv msgpack-jruby-*.gem pkg)
end