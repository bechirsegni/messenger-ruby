require 'spec_helper'

module Messenger
  module Elements
    describe Image do
      let(:image) do
        described_class.new(url: "http://example.com")
      end

      describe '#new' do
        it 'has proper type' do
          expect(image.type).to eq('image')
        end
      end

      describe '#payload' do
        it 'returns hash with not-nil allowed attributes' do
          expect(image.payload).to eq({ "url"=>"http://example.com" })
        end
      end

      describe '#build' do
        it 'return correct hash' do
          expect(image.build).to eq({:attachment=>{:type=>"image", :payload=>image.payload}})
        end
      end
    end
  end
end
