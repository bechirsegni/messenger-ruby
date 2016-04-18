module Messenger
  class Configuration
    attr_accessor :verify_token, :page_access_token

    def initialize(verify_token: nil, page_access_token: nil)
      @verify_token = verify_token
      @page_access_token = page_access_token
    end
  end
end
