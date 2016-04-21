require 'messenger/components/element'

module Messenger
  module Elements
    class Address < Components::Element
      def initialize(street_1:, street_2: nil, city:, postal_code:, state:, country:)
        @street_1 = street_1
        @street_2 = street_2
        @city = city
        @postal_code = postal_code
        @state = state
        @country = country
      end
    end
  end
end
