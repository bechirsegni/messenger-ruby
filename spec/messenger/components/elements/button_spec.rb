require 'spec_helper'

module Messenger
  module Elements
    describe Button do
      let(:web_url_button) do
        described_class.new(type: "web_url", title: "Button", value: "test")
      end
      let(:postback_button) do
        described_class.new(type: "postback", title: "Button", value: "test")
      end

      describe '#build' do
        describe 'postback type' do
          it 'return hash with type, title and payload' do
            expect(postback_button.build).to eq(
              :type    => "postback",
              :title   => "Button",
              :payload => "test"
            )
          end
        end

        describe 'web_url type' do
          it 'return hash with type, title and url' do
            expect(web_url_button.build).to eq(
              :type  => "web_url",
              :title => "Button",
              :url   => "test"
            )
          end
        end
      end
    end
  end
end
