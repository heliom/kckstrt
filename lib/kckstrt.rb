# encoding: utf-8

require 'gli'
require 'erubis'
require 'fileutils'
require 'kckstrt/version'
require 'highline/import'
require 'ext/string'

module Kckstrt
  extend GLI::App

  program_desc 'Sinatra app generator'
  version Kckstrt::VERSION

  desc 'Generate an app'
  command :generate do |c|
    c.desc 'Force generation'
    c.switch [:f, :force]
    c.flag [:d, :directory], default_value: '.'

    c.action do |global_options, options, args|
      @options = options
      @options[:directory].sub!(/\/$/, '')

      generate_app(args.first)
    end
  end

  def self.generate_app(app_name)
    return say('Please specify an app name. See `kckstrt generate --help`.') unless app_name

    @dirname = "#{@options[:directory]}/#{app_name.underscore}"
    @app_name = app_name.underscore.camelize

    return say("Invalid application name #{@app_name}. Please give a name which does not start with numbers.") if /^\d/.match(@app_name)

    if mkdir(@dirname)
      copy_templates(@dirname)
      init_templates

      say("=> cd #{@dirname} && script/setup")
    end
  end

  def self.mkdir(dirname)
    if File.directory?(dirname) && !@options[:force]
      say("#{dirname} folder is not empty. Use the --force flag to overwrite.")
      return false
    end

    FileUtils.rm_rf(dirname)
    FileUtils.mkdir_p(dirname)
    true
  end

  def self.copy_templates(dest)
    src = File.expand_path('../kckstrt/templates', __FILE__)
    FileUtils.copy_entry(src, dest)
  end

  def self.init_templates
    Dir["#{@dirname}/**/*.template"].each do |file|
      template = File.read(file)
      content = Erubis::Eruby.new(template, pattern: '{{ }}').result(binding)

      File.open(file, 'w+') do |f|
        f.write(content)
      end

      File.rename(file, file.sub('.template', ''))
    end
  end
end
