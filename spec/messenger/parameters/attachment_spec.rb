require 'spec_helper'

module Messenger
  module Parameters
    describe Attachment do
      describe '#new' do
        describe 'attachment is not `location`' do
          subject do
            described_class.new(type: 'image', payload: { 'url' => 'http://example.com' })
          end

          it 'creates correct `url` attribute' do
            expect(subject.url).to eq 'http://example.com'
          end
        end

        describe 'attachment is `location`' do
          subject do
            described_class.new(type: 'location', payload: { 'coordinates' => { 'long' => 10, 'lat' => 20 }})
          end

          it 'creates correct `long` attribute' do
            expect(subject.long).to eq 10
          end

          it 'creates correct `lat` attribute' do
            expect(subject.lat).to eq 20
          end
        end
      end
    end
  end
end
