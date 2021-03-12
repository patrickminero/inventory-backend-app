require 'rails_helper'

RSpec.describe "Companies", type: :request do
  describe "GET /index" do
    
    it 'Should return all companies' do
      get '/api/v1/companies'
      expect(response).to have_http_status(:ok)
    end

    it 'should be empty' do
      get '/api/v1/companies'
      
      expect(JSON.parse(response.body)["companies"].size).to eq(0)
    end
    it 'return return the right amount of records' do
      user = User.create(email: 'test@email.com', password: 'asdasd', password_confirmation: 'asdasd')
      FactoryBot.create(:company, name: 'Apple, INC', location: 'Palo Alto, CA', service: 'Tech', categories: ['Software', 'Hardware'], subcategories: ['Computers', 'Smartphones'], user: user)
      FactoryBot.create(:company, name: 'Facebook, INC', location: 'Menlopark, CA', service: 'Social Media', categories: ['Software', 'marketing'], subcategories: ['Instagram', 'Facebook'], user: user)
      
      get '/api/v1/companies'

      expect(JSON.parse(response.body)["companies"].size).to eq(2)
    end

    it 'should return the right record' do
      user = User.create(email: 'test@email.com', password: 'asdasd', password_confirmation: 'asdasd')
      FactoryBot.create(:company, name: 'Apple, INC', location: 'Palo Alto, CA', service: 'Tech', categories: ['Software', 'Hardware'], subcategories: ['Computers', 'Smartphones'], user: user)
      
      get '/api/v1/companies'
      expect(JSON.parse(response.body)["companies"][0]["name"]).to eq('Apple, INC')
    end
  end
end
