require 'spec_helper'

module Messenger
  module Elements
    describe Image do
      subject do
        described_class.new(url: "http://example.com")
      end

      describe '#new' do
        it 'has proper type' do
          expect(subject.type).to eq('image')
        end
      end

      describe '#payload' do
        it 'returns hash with not-nil allowed attributes' do
          expect(subject.payload).to eq("url" => "http://example.com")
        end
      end

      describe '#build' do
        it 'return correct hash' do
          expect(subject.build).to eq(
            :attachment => {
              :type    => "image",
              :payload => subject.payload
            }
          )
        end
      end
    end
  end
end
