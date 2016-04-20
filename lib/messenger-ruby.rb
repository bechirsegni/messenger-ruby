require "messenger/version"
require "messenger/configuration"

require "messenger/components/elements/text"
require "messenger/components/elements/image"
require "messenger/components/elements/button"
require "messenger/components/elements/bubble"

require "messenger/components/elements/receipt/address"
require "messenger/components/elements/receipt/adjustment"
require "messenger/components/elements/receipt/item"
require "messenger/components/elements/receipt/order"
require "messenger/components/elements/receipt/summary"

require "messenger/components/templates/buttons"
require "messenger/components/templates/generic"
require "messenger/components/templates/receipt"

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
