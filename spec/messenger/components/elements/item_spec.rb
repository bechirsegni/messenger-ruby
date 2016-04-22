require 'spec_helper'

module Messenger
  module Elements
    describe Item do
      let(:item) do
        described_class.new(title: "Test", subtitle: "ABC", quantity: 3, price: nil)
      end

      describe '#build' do
        it 'return correct hash with not-nil instance values' do
          expect(item.build).to eq({"title"=>"Test", "subtitle"=>"ABC", "quantity"=>3})
        end
      end
    end
  end
end
