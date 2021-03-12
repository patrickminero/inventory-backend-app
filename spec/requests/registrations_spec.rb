require 'rails_helper'

RSpec.describe "Registrations", type: :request do
  describe 'POST /api/v1/signup' do
    it 'should be able to create accout' do
      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/sign_up", :params => { :user => {:email => "test@email.com", password: 'asdasd', password_confirmation: 'asdasd'} }, :headers => headers

      expect(response.content_type).to eq("application/json; charset=utf-8")
      expect(response).to have_http_status(:created)
    end

    it 'should return the user data' do

      headers = { "ACCEPT" => "application/json" }
      post "/api/v1/sign_up", :params => { :user => {:email => "test@email.com", password: 'asdasd', password_confirmation: 'asdasd'} }, :headers => headers
      
      expect(JSON.parse(response.body)["data"]["user"]["email"]).to eq('test@email.com')
    end
  end
end
