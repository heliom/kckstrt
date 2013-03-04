require 'spec_helper'

describe Kckstrt do

  before :each do
    @old_stderr = $stderr
    $stderr = StringIO.new
    @old_stdout = $stdout
    $stdout = StringIO.new
  end

  after :each do
    $stderr = @old_stderr
    $stdout = @old_stdout

    FileUtils.rm_rf('./tmp/test')
  end

  context 'generator' do
    it 'expects an app name' do
      HighLine.any_instance.should_receive(:say).
        with('Please specify an app name. See `kckstrt generate --help`.')

      Kckstrt.run %w(generate)
    end

    it 'validates the app name' do
      HighLine.any_instance.should_receive(:say).
        with('Invalid application name 123app. Please give a name which does not start with numbers.')

      Kckstrt.run %w(generate 123app)
    end

    it 'generates the app in the specified directory' do
      HighLine.any_instance.should_receive(:say)
      Kckstrt.run %w(generate test --directory ./tmp)
      File.directory?('./tmp/test').should be_true
    end

    context 'when output directory is not empty' do
      before :each do
        FileUtils.mkdir_p('./tmp/test/not_empty')
      end

      it 'exits when no force option' do
        HighLine.any_instance.should_receive(:say).
          with('./tmp/test folder is not empty. Use the --force flag to overwrite.')

        Kckstrt.run %w(generate test --directory ./tmp)
      end

      it 'proceeds with force option' do
        HighLine.any_instance.should_receive(:say).
          with('=> cd ./tmp/test && script/setup')

        Kckstrt.run %w(generate test --directory ./tmp --force)
      end
    end
  end

end
