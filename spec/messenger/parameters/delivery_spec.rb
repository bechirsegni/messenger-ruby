require 'spec_helper'

module Messenger
  module Parameters
    describe Delivery do
      subject do
        described_class.new(watermark: "abc", seq: 10)
      end

      describe '#type' do
        it 'includes `delivery`' do
          expect(subject.type).to include 'delivery'
        end
      end

      describe '#delivery?' do
        it 'returns true' do
          expect(subject.delivery?).to eq true
        end
      end

      describe '#message?' do
        it 'returns false' do
          expect(subject.message?).to eq false
        end
      end

      describe '#optin?' do
        it 'returns false' do
          expect(subject.optin?).to eq false
        end
      end

      describe '#postback?' do
        it 'returns true' do
          expect(subject.postback?).to eq false
        end
      end
    end
  end
end
