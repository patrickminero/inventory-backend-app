# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'Starting seeds'
Product.destroy_all
p 'Destroyed all products'
Location.destroy_all
p 'Destroy all locations'
Company.destroy_all
p 'Destroyed all companies'
User.destroy_all
p 'Destroyed all users'


categories = ['Shirt', 'Pants', 'Socks', 'Jacket', 'T-shirt', 'Hat', 'Underwear']
description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'
size = ['XS', 'S', 'M', 'L', 'XL']
color = ['Black', 'Grey', 'Blue', 'Green', 'Brown']
fabric = ['Cotton', 'Poliester', 'Silk', 'Blend', 'Hemp']
subcategories = ['Dress shirts', 'Jeans', 'Ankle socks', 'Leather Jackets', 'Cotton Briefs']

variable = ['variable', 'fixed']
user = User.create!(email: 'patrick@email.com', password: 'asdasd', password_confirmation: 'asdasd')
user2 = User.create!(email: 'marta@email.com', password: 'asdasd', password_confirmation: 'asdasd')
p "Created #{User.count} users"

company = Company.create!(name: 'Clothery SL', location: 'Barcelona, Catalonia, Spain', service: 'Retail', categories: categories, subcategories: subcategories, user: user)
p "Created company #{company.name}"

location = Location.create!(name: 'Store#001', address: 'Gran via de les Corts Catalanes 560, Barcelona, Spain 08015', company: company)

user.location_id = location.id
user2.location_id = location.id
user.save!
user2.save!

p "Created Location #{location.name} for company #{company.name}"
categories.each do |cat|
  counter = 0
  size.each do |prod|
    
    Product.create!(name: "#{cat} #{prod}", price: rand(10..30), company: company, location: location, description: description, category: cat, subcategory: subcategories[counter], sku: rand(1000000..2000000).to_s, quantity: rand(50..150), product_type: variable.sample, product_attributes: {size: size.sample, color: color.sample, fabric: fabric.sample})
    counter += 1
  end
end

p "Finished creating #{Product.count} products"
