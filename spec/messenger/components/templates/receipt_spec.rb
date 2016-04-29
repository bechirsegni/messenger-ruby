require 'spec_helper'

module Messenger
  module Templates
    describe Receipt do

      let(:order) do
        Elements::Order.new(order_number: '1234', currency: 'USD', payment_method: 'Visa')
      end

      let(:item) { Elements::Item.new(title: 'Test', subtitle: 'ABC', quantity: 3) }
      let(:summary) { Elements::Summary.new(total_tax: 20.30, total_cost: 30.20) }

      subject do
        described_class.new(
          recipient_name: 'John Doe',
          order:          order,
          elements:       [item],
          summary:        summary
        )
      end

      describe '#new' do
        it 'builds elements correctly' do
          expect(subject.elements).to eq([item.build])
        end
      end

      describe '#payload' do
        it 'returns hash with allowed not-nil attributes only' do
          expect(subject.payload).to eq(
            'recipient_name' => 'John Doe',
            'template_type'  => 'receipt',
            'order_number'   => '1234',
            'currency'       => 'USD',
            'payment_method' => 'Visa',
            'elements'       => [item.build],
            'summary'        => summary.build
          )
        end
      end

      describe 'flattened_attributes' do
        it 'returns hash with order attributes' do
          expect(subject.flattened_attributes).to eq(
            'order_number'   => '1234',
            'currency'       => 'USD',
            'payment_method' => 'Visa'
          )
        end
      end

      describe '#build' do
        it 'returns attachment hash with correct type and payload' do
          expect(subject.build).to eq(
            attachment: {
              type:    'template',
              payload: subject.payload
            }
          )
        end
      end
    end
  end
end
