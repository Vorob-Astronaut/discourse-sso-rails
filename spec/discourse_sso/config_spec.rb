require 'spec_helper'

describe DiscourseSSO::Config do
  it 'should save secret' do
    DiscourseSSO::Config.configure do |config|
      config.sercet = 'oh_my_secret'
    end

    expect(DiscourseSSO::Config.instance.secret).to eq('oh_my_secret')
  end
end
