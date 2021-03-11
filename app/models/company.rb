class Company < ApplicationRecord
  belongs_to :user
  has_many :products
  validates :name, uniqueness: true
  validates :name, :location, :service, :categories, :subcategories, presence: true
end
