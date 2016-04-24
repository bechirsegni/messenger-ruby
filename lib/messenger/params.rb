module Messenger
  class Params
    attr_accessor :params

    def initialize(params)
      @params = params
    end

    end

    private

    def messaging_entry
      params['entry'][0]['messaging'][0]
    end
  end
end
