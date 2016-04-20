require "messenger/version"
require "messenger/configuration"
require "messenger/client"
require "messenger/request"

module Messenger
  class << self
    attr_accessor :config

    def config
      @config ||= Configuration.new
    end

    def configure
      yield(config)
    end

    def reset
      @config = Configuration.new
    end
  end
end

require "messenger/engine"
