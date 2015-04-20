require 'singleton'

class DiscourseSSO
  class Config
    include Singleton
    attr_accessor :secret

    def self.configure(&block)
      config = self.instance

      block.call(config)
    end
  end
end
