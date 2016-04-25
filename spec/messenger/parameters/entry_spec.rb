require 'spec_helper'

module Messenger
  module Parameters
    describe Entry do
      describe '#new' do
        describe 'attachments not present' do
          subject do
            described_class.new(id: "1234", time: "1200", messaging: nil)
          end

          it 'does not build messagings' do
            expect(subject.messagings).to eq nil
          end
        end

        describe 'messagings is an empty array' do
          subject do
            described_class.new(id: "1234", time: "1200", messaging: [])
          end

          it 'does not build messagings' do
            expect(subject.messagings).to eq nil
          end
        end

        describe 'messagings present' do
          subject do
            described_class.new(
              id: "1234",
              time: "1200",
              messaging: [
                {
                  sender: { 'id' => '1234' },
                  recipient: { 'id' => '5678' },
                  message: {
                    mid: "1234",
                    seq: "1",
                    text: "Test"
                  }
                }
              ]
            )
          end

          it 'builds Messaging objects inside messagings attribute' do
            expect(subject.messagings).to all(be_an(Messaging))
          end
        end
      end
    end
  end
end
