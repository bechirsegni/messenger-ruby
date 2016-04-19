require "spec_helper"

module Messenger
  describe MessengerController, type: :controller do
    routes { Messenger::Engine.routes }

    let(:facebook_params) do
      { 'hub.verify_token' => "TEST_TOKEN", 'hub.challenge' => 'test_challenge' }
    end

    describe 'get #validate' do
      describe 'bot is already activated' do
        before do
          described_class.any_instance.stub(:bot_active?).and_return(true)
        end

        describe 'verify token is correct' do
          before { Messenger.config.verify_token = "TEST_TOKEN" }

          it 'should return `hub.challenge`' do
            get :validate, facebook_params
            expect(response.body).to eq('test_challenge')
          end
        end
      end
    end
  end
end
