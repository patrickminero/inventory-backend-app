class Company < ApplicationRecord
  has_many :products
  validates :name, uniqueness: true
  validates :name, :location, :service, :categories, :subcategories, presence: true
end
