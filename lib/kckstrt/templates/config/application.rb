# encoding: utf-8
require File.expand_path('../boot', __FILE__)

class Kckstrt::App < Sinatra::Base
  set :root, File.expand_path('../../app',  __FILE__)
  set :public_folder, File.expand_path('../../public',  __FILE__)
  set :erb, :layout => :'layouts/application'

  helpers Sinatra::Cookies

  configure :development do
    register Sinatra::Reloader
  end

  configure :production do
    LAST_MODIFIED = Time.now

    before do
      cache_control :public, max_age: 86400
      last_modified LAST_MODIFIED
    end
  end

  before do
    if request.path.match /.+\/$/
      redirect request.path.sub(/\/$/, ''), 301
    end
  end

  # Routes
  get '/' do
    erb :index
  end

  # Errors
  not_found do
    erb :'404'
  end
end
