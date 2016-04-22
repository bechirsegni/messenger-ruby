require 'spec_helper'

module Messenger
  module Elements
    describe Summary do
      subject do
        described_class.new(total_tax: 20.30, total_cost: 30.20)
      end

      describe '#build' do
        it 'return correct hash with not-nil instance values' do
          expect(subject.build).to eq("total_tax"=>20.30, "total_cost"=>30.20)
        end
      end
    end
  end
end
