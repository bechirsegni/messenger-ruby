require 'spec_helper'

module Messenger
  module Parameters
    describe Postback do
      subject do
        described_class.new(payload: "abc")
      end

      describe '#type' do
        it 'includes `postback`' do
          expect(subject.type).to include 'postback'
        end
      end

      describe '#delivery?' do
        it 'returns false' do
          expect(subject.delivery?).to eq false
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
          expect(subject.postback?).to eq true
        end
      end
    end
  end
end
