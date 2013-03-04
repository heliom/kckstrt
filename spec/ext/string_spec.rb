require 'spec_helper'

describe String do

  it 'underscores' do
    expect('MySweetApp'.underscore).to eq('my_sweet_app')
    expect('MySweet::App'.underscore).to eq('my_sweet/app')
  end

  it 'camelizes' do
    expect('my_sweet_app'.camelize).to eq('MySweetApp')
    expect('my_sweet/app'.camelize).to eq('MySweet::App')
  end

end
