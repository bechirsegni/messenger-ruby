require 'spec_helper'

module Messenger
  module Elements
    describe Text do
      subject do
        described_class.new(text: 'Test')
      end

      describe '#build' do
        it 'return correct hash' do
          expect(subject.build).to eq("text" => "Test")
        end
      end
    end
  end
end
