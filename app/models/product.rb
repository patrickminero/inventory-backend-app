class Product < ApplicationRecord
  belongs_to :company
  belongs_to :location
  validates :name,  uniqueness: true
  validates :name, :quantity, :description, :category, :subcategory, :sku, :product_type, presence: true

  def update_quantity(quantity)
    self.quantity = quantity
    save
  end
end
