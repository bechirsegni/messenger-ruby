require 'spec_helper'

module Messenger
  module Elements
    describe Adjustment do
      subject do
        described_class.new(name: "Test", amount: 20)
      end

      describe '#build' do
        it 'return correct hash with not-nil instance values' do
          expect(subject.build).to eq(
            "name"   => "Test",
            "amount" => 20
          )
        end
      end
    end
  end
end
