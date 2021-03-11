class Product < ApplicationRecord
  belongs_to :company
  validates :name,  uniqueness: true
  validates :name, :quantity, :description, :category, :subcategory, :sku, :product_type, presence: true
end
