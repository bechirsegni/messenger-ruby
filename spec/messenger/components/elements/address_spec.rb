require 'spec_helper'

module Messenger
  module Elements
    describe Address do
      subject do
        described_class.new(
          street_1:    "Test",
          street_2:    nil,
          city:        "Some city",
          postal_code: "20233",
          state:       "LA",
          country:     "Tatooine"
        )
      end

      describe '#build' do
        it "return correct hash with not-nil instance values" do
          expect(subject.build).to eq(
            "street_1"    => "Test",
            "city"        => "Some city",
            "postal_code" => "20233",
            "state"       => "LA",
            "country"     => "Tatooine"
          )
        end
      end
    end
  end
end
