require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /index" do
    
    it 'Should return all products' do
      get '/api/v1/companies/24/products'
      expect(response).to have_http_status(:ok)
    end

    it 'should be empty' do
      get '/api/v1/companies/24/products'
      expect(JSON.parse(response.body).size).to eq(0)
    end
    it 'return return the right amount of records' do
      user = User.create(email: 'test@email.com', password: 'asdasd', password_confirmation: 'asdasd')
      company = FactoryBot.create(:company, name: 'Apple, INC', location: 'Menlopark, CA', service: 'Technology', categories: ['Software', 'Hardware'], subcategories: ['Computers', 'Smartphones'], user: user)
      location = FactoryBot.create(:location, name: 'Store#001', address: 'Gran via de les Corts Catalanes 470', company: company)
      FactoryBot.create(:product, name: 'Iphone X', price: 799.99, description: 'Black matte 5.6 in screen', category: 'Hardware', subcategory: 'Smartphones', sku: rand(1000000..2000000), company: company, quantity: 300, product_attributes: {color: 'black matte', screen_size: '5.6'}, product_type: 'Fixed', location: location)
      FactoryBot.create(:product, name: 'Iphone Xs', price: 799.99, description: 'Blue matte 5.6 in screen', category: 'Hardware', subcategory: 'Smartphones', sku: rand(1000000..2000000), company: company, quantity: 300, product_attributes: {color: 'Blue matte', screen_size: '7.6'}, product_type: 'Fixed', location: location)
      get "/api/v1/companies/#{company.id}/products"
      expect(JSON.parse(response.body).size).to eq(2)
    end

    it 'should return the right record' do
      user = User.create(email: 'test@email.com', password: 'asdasd', password_confirmation: 'asdasd')
      company = FactoryBot.create(:company, name: 'Apple, INC', location: 'Menlopark, CA', service: 'Technology', categories: ['Software', 'Hardware'], subcategories: ['Computers', 'Smartphones'], user: user)
      location = FactoryBot.create(:location, name: 'Store#001', address: 'Gran via de les Corts Catalanes 470', company: company)
      product = FactoryBot.create(:product, name: 'Iphone X', price: 799.99, description: 'Black matte 5.6 in screen', category: 'Hardware', subcategory: 'Smartphones', sku: rand(1000000..2000000), company: company, quantity: 300, product_attributes: {color: 'black matte', screen_size: '5.6'}, product_type: 'Fixed', location: location)
      
      get "/api/v1/companies/#{company.id}/products/#{product.id}"
      expect(JSON.parse(response.body)["content"]["name"]).to eq(product.name)
    end

    it 'should be able to update quantity' do
      user = User.create(email: 'test@email.com', password: 'asdasd', password_confirmation: 'asdasd')
      company = FactoryBot.create(:company, name: 'Apple, INC', location: 'Menlopark, CA', service: 'Technology', categories: ['Software', 'Hardware'], subcategories: ['Computers', 'Smartphones'], user: user)
      location = FactoryBot.create(:location, name: 'Store#001', address: 'Gran via de les Corts Catalanes 470', company: company)
      product = FactoryBot.create(:product, name: 'Iphone X', price: 799.99, description: 'Black matte 5.6 in screen', category: 'Hardware', subcategory: 'Smartphones', sku: rand(1000000..2000000), company: company, quantity: 300, product_attributes: {color: 'black matte', screen_size: '5.6'}, product_type: 'Fixed', location: location)
      random = rand(10..50)

      post "/api/v1/companies/#{company.id}/products/#{product.id}/update_quantity?quantity=#{random}"
      expect(JSON.parse(response.body)["product"]["quantity"]).to eq(random)
    end
  end
end
