require "spec_helper"

module Messenger
  describe MessengerController, type: :controller do
    routes { Messenger::Engine.routes }

    let(:facebook_params) do
      { 'hub.verify_token' => "TEST_TOKEN", 'hub.challenge' => 'test_challenge' }
    end

    let(:app_url) do
      subject.instance_eval { app_location }
    end

    describe 'get #validate' do
      describe 'access page token is correct' do
        before do
          stub_request(:get, app_url).to_return(body: '{"data":[{"name":"Some App"}]}')
        end

        describe 'verify token is correct' do
          before { Messenger.config.verify_token = "TEST_TOKEN" }

          it 'should return `hub.challenge`' do
            get :validate, facebook_params
            expect(response.body).to eq('test_challenge')
          end
        end

        describe 'verify token is invalid' do
          before { Messenger.config.verify_token = "INVALID_TEST_TOKEN" }

          it 'should return message about invalid token' do
            get :validate, facebook_params
            expect(response.body).to eq('Invalid verify token')
          end
        end
      end

      describe 'bot is not activated' do
        before do
          Messenger.config.verify_token = "TEST_TOKEN"
          stub_request(:get, app_url).to_return(body: '{"data":[]}')
        end

        describe 'page_access_token is correct' do
          before { stub_request(:get, app_url).to_return(body: '{"data":[{"name":"Some App"}]}') }

          it 'should return `hub.challenge`' do
            get :validate, facebook_params
            expect(response.body).to eq('test_challenge')
          end
        end

        describe 'page_access_token is invalid' do
          before { stub_request(:get, app_url).to_return(status: 400) }

          it 'should return message about invalid access token' do
            get :validate, facebook_params
            expect(response.body).to eq('Invalid page access token')
          end
        end
      end
    end
  end
end
