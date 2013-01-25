require 'gli'
require 'kckstrt/version'

module Kckstrt
  extend GLI::App

  program_desc 'Sinatra app generator'
  version Kckstrt::VERSION
end
