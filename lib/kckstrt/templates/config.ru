require File.expand_path('../config/application',  __FILE__)

use Rack::Deflater

# Sprockets
map '/assets' do
  Assets = Sprockets::Environment.new

  Assets.append_path 'app/assets/images'
  Assets.append_path 'app/assets/javascripts'
  Assets.append_path 'app/assets/stylesheets'

  Stylus.setup Assets
  Stylus.nib = true

  if ENV['RACK_ENV'] != 'development'
    Assets.js_compressor = Uglifier.new(mangle: true)
    Stylus.compress = true
  end

  run Assets
end

# Main application
map '/' do
  run Kckstrt::App
end
