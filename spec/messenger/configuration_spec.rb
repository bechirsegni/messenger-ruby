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
  end
end
