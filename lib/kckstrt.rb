# encoding: utf-8

require 'gli'
require 'kckstrt/version'
require 'highline/import'
require 'active_support/core_ext/string/inflections'

module Kckstrt
  extend GLI::App

  program_desc 'Sinatra app generator'
  version Kckstrt::VERSION

  desc 'Generate an app'
  command :generate do |c|
    c.desc 'Force generation'
    c.switch [:f, :force]

    c.action do |global_options, options, args|
      @options = options
      generate_app(args.first)
    end
  end

  def self.generate_app(app_name)
    return say('Please specify an app name. See `kckstrt generate --help`.') unless app_name

    @dirname = app_name.underscore
    @app_name = @dirname.camelize

    mkdir(@dirname)
    copy_templates(@dirname)
  end

  def self.mkdir(dirname)
    return say("“#{dirname}” folder is not empty. Use the --force flag to overwrite.") if File.directory?(dirname) && !@options[:force]

    FileUtils.rm_rf(dirname)
    Dir.mkdir(dirname)
  end

  def self.copy_templates(dest)
    src = File.expand_path('../kckstrt/templates', __FILE__)
    FileUtils.copy_entry(src, dest)
  end
end
