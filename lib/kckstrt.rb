# encoding: utf-8

require 'gli'
require 'ext/string'
require 'kckstrt/version'
require 'highline/import'

module Kckstrt
  extend GLI::App

  program_desc 'Sinatra app generator'
  version Kckstrt::VERSION

  desc 'Force generation'
  switch [:f, :force]

  desc 'Generate an app'
  command :generate do |c|
    c.desc 'Force generation'
    c.switch [:f, :force]

    c.action do |global_options, options, args|
      forced = global_options[:force] || options[:force]
      generate_app(args.first, forced)
    end
  end

  def self.generate_app(app_name, forced)
    return say('Please specify an app name. See `kckstrt generate --help`.') unless app_name

    dirname = app_name.underscore

    mkdir(dirname, forced)
    copy_templates(dirname)
  end

  def self.mkdir(dirname, forced)
    return say("“#{dirname}” folder is not empty. Use the --force flag to overwrite.") if File.directory?(dirname) && !forced

    FileUtils.rm_rf(dirname)
    Dir.mkdir(dirname)
  end

  def self.copy_templates(dest)
    src = File.expand_path('../kckstrt/templates', __FILE__)
    FileUtils.copy_entry(src, dest)
  end
end
