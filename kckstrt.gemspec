# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','kckstrt','version.rb'])

spec = Gem::Specification.new do |s|
  s.name = 'kckstrt'
  s.authors = ['Etienne Lemay', 'Rafael Blais-Masson']
  s.email = 'fellowship@heliom.ca'
  s.homepage = 'https://github.com/heliom/kckstrt'
  s.summary = 'Sinatra app generator'

  s.version = Kckstrt::VERSION
  s.platform = Gem::Platform::RUBY

  s.files = %w(LICENSE.md README.md Rakefile kckstrt.gemspec)
  s.files += Dir.glob("lib/**/*")
  s.files += Dir.glob("bin/**/*")
  s.files += Dir.glob("etc/**/*")

  s.bindir = 'bin'
  s.executables << 'kckstrt'

  s.require_paths << 'lib'
  s.add_dependency('erubis', '~> 2.7.0')
  s.add_dependency('highline', '~> 1.6.15')
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.13.0')
  s.add_runtime_dependency('gli', '2.5.2')
end
