class AddProductAttributesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :product_attributes, :json, default: {}
  end
end
