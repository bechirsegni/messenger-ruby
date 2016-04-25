require 'spec_helper'

module Messenger
  module Parameters
    describe Message do
      subject do
        described_class.new(mid: "abc", seq: 10)
      end

      describe '#type' do
        it 'includes `message`' do
          expect(subject.type).to include 'message'
        end
      end

      describe '#delivery?' do
        it 'returns false' do
          expect(subject.delivery?).to eq false
        end
      end

      describe '#message?' do
        it 'returns true' do
          expect(subject.message?).to eq true
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

      describe '#new' do
        describe 'attachments not present' do
          subject do
            described_class.new(mid: "abc", seq: 10, attachments: nil)
          end

          it 'does not build attachments' do
            expect(subject.attachments).to eq nil
          end
        end

        describe 'attachments is an empty array' do
          subject do
            described_class.new(mid: "abc", seq: 10, attachments: [])
          end

          it 'does not build attachments' do
            expect(subject.attachments).to eq nil
          end
        end

        describe 'attchments present' do
          subject do
            described_class.new(
              mid: "abc",
              seq: 10,
              attachments: [
                { type: 'image', payload: { 'url' => 'abc' } },
                { type: 'audio', payload: { 'url' => 'xyz' } },
              ]
            )
          end

          it 'builds Attachment objects inside attachments attribute' do
            expect(subject.attachments).to all(be_an(Attachment))
          end
        end
      end
    end
  end
end
