require 'spec_helper'

module Messenger
  module Templates
    describe Buttons do

      let(:button) { Elements::Button.new(type: 'web_url', title: 'Button', value: 'Some Button') }

      subject do
        described_class.new(
          text: 'Test',
          buttons: [button]
        )
      end

      describe '#new' do
        it 'builds buttons correctly' do
          expect(subject.buttons).to eq([button.build])
        end
      end

      describe '#payload' do
        it 'returns hash with allowed not-nil attributes only' do
          expect(subject.payload).to eq(
            'template_type' => 'button',
            'text'          => 'Test',
            'buttons'       => [button.build]
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
