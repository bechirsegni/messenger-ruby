require 'spec_helper'

module Messenger
  module Elements
    describe Order do
      let(:order) do
        described_class.new(
          order_number: "1234",
          currency: "USD",
          payment_method: "Visa",
          timestamp: nil
        )
      end

      describe '#build' do
        it 'return correct hash with not-nil instance values' do
          expect(order.build).to eq({"order_number"=>"1234", "currency"=>"USD", "payment_method"=>"Visa"})
        end
      end
    end
  end
end
