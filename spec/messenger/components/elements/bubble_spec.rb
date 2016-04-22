require 'spec_helper'

module Messenger
  module Elements
    describe Bubble do
      let(:button) do
        Button.new(type: "postback", title: "Button", value: "test")
      end
      let(:bubble) do
        described_class.new(title: "First", subtitle: "Bubble", item_url: nil, buttons: [button])
      end

      describe '#new' do
        it 'builds buttons correctly' do
          expect(bubble.buttons).to eq([button.build])
        end
      end

      describe '#build' do
        it 'return hash with all not-nil instance values' do
          expect(bubble.build).to eq({ "title"=>"First", "subtitle"=>"Bubble", "buttons"=>[button.build]})
        end
      end
    end
  end
end
