class Company < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :locations
  validates :name, uniqueness: true
  validates :name, :location, :service, :categories, :subcategories, presence: true
end
