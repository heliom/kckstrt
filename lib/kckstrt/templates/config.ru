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

  run Assets
end

# Main application
map '/' do
  run Kckstrt::App
end
