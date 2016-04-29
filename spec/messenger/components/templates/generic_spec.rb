require 'spec_helper'

module Messenger
  module Templates
    describe Generic do

      let(:button) { Elements::Button.new(type: 'web_url', title: 'Button', value: 'Some Button') }
      let(:bubble) { Elements::Bubble.new(title: 'First', subtitle: 'Bubble', buttons: [button]) }

      subject { described_class.new(elements: [bubble]) }

      describe '#new' do
        it 'builds elements correctly' do
          expect(subject.elements).to eq([bubble.build])
        end
      end

      describe '#payload' do
        it 'returns hash with allowed not-nil attributes only' do
          expect(subject.payload).to eq(
            'template_type' => 'generic',
            'elements'      => [bubble.build]
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
