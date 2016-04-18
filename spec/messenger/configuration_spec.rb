require "spec_helper"

module Messenger
  describe Configuration do
    describe '#verify_token' do
      it 'is nil by deafult' do
        expect(Configuration.new.verify_token).to be nil
      end
    end

    describe '#page_access_token' do
      it 'is nil by deafult' do
        expect(Configuration.new.page_access_token).to be nil
      end
    end

    describe '#verify_token=' do
      it 'sets verify_token properly' do
        config = Configuration.new
        config.verify_token = 'some token'
        expect(config.verify_token).to eql 'some token'
      end
    end

    describe '#page_access_token=' do
      it 'sets page_access_token properly' do
        config = Configuration.new
        config.page_access_token = 'some token'
        expect(config.page_access_token).to eql 'some token'
      end
    end
  end
end
