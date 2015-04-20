require 'singleton'

class DiscourseSSO::Config
  include Singleton
  attr_accessor :secret

  def self.configure(&block)
    config = self.instance

    block.call(config)
  end
end
