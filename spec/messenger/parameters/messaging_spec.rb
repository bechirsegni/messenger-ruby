require 'spec_helper'

module Messenger
  module Parameters
    describe Messaging do
      describe '#new' do
        subject do
          described_class.new(
            sender: { 'id' => '1234' },
            recipient: { 'id' => '5678' },
            message: { mid: "abc", seq: 10 }
          )
        end

        it 'assignes correct sender_id' do
          expect(subject.sender_id).to eq('1234')
        end

        it 'assignes correct recipient_id' do
          expect(subject.recipient_id).to eq('5678')
        end

        describe 'message is present' do
          subject do
            described_class.new(
              sender: { 'id' => '1234' },
              recipient: { 'id' => '5678' },
              message: { mid: "abc", seq: 10 }
            )
          end

          it 'creates Message object as callback' do
            expect(subject.callback).to be_an(Message)
          end
        end

        describe 'delivery is present' do
          subject do
            described_class.new(
              sender: { 'id' => '1234' },
              recipient: { 'id' => '5678' },
              delivery: { watermark: "abc", seq: 10 }
            )
          end

          it 'creates Delivery object as callback' do
            expect(subject.callback).to be_an(Delivery)
          end
        end

        describe 'optin is present' do
          subject do
            described_class.new(
              sender: { 'id' => '1234' },
              recipient: { 'id' => '5678' },
              optin: { ref: "abc" }
            )
          end

          it 'creates Optin object as callback' do
            expect(subject.callback).to be_an(Optin)
          end
        end

        describe 'postback is present' do
          subject do
            described_class.new(
              sender: { 'id' => '1234' },
              recipient: { 'id' => '5678' },
              postback: { payload: "abc" }
            )
          end

          it 'creates Postback object as callback' do
            expect(subject.callback).to be_an(Postback)
          end
        end
      end
    end
  end
end
