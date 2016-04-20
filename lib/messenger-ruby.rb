require "messenger/version"
require "messenger/configuration"

require "messenger/components/elements/text"
require "messenger/components/elements/image"
require "messenger/components/elements/button"
require "messenger/components/elements/bubble"
require "messenger/components/templates/buttons"
require "messenger/components/templates/generic"

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
