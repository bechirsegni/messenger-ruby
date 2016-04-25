require 'spec_helper'

module Messenger
  module Parameters
    describe Optin do
      subject do
        described_class.new(ref: "abc")
      end

      describe '#type' do
        it 'includes `optin`' do
          expect(subject.type).to include 'optin'
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
        it 'returns true' do
          expect(subject.optin?).to eq true
        end
      end

      describe '#postback?' do
        it 'returns false' do
          expect(subject.postback?).to eq false
        end
      end
    end
  end
end
