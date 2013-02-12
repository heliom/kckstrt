# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','kckstrt','version.rb'])

spec = Gem::Specification.new do |s|
  s.name = 'kckstrt'
  s.author = 'Etienne Lemay'
  s.email = 'etienne@heliom.ca'
  s.homepage = 'https://github.com/heliom/kckstrt'
  s.summary = 'Sinatra app generator'

  s.version = Kckstrt::VERSION
  s.platform = Gem::Platform::RUBY

  s.files = %w(LICENSE.md README.md Rakefile kckstrt.gemspec)
  s.files += Dir.glob("lib/**/*.rb")
  s.files += Dir.glob("bin/**/*")
  s.files += Dir.glob("etc/**/*")

  s.bindir = 'bin'
  s.executables << 'kckstrt'

  s.require_paths << 'lib'
  s.add_dependency('highline', '~> 1.6.15')
  s.add_dependency('activesupport', '~> 3.2.11')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.12.0')
  s.add_development_dependency('rspec-mocks', '~> 2.12.0')
  s.add_runtime_dependency('gli', '2.5.2')
end
