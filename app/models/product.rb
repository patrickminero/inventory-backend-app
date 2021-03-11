class Product < ApplicationRecord
  belongs_to :company
  validates :name,  uniqueness: true
  validates :name, :price, :description, :category, :subcategory, :sku, :variable, presence: true
end
