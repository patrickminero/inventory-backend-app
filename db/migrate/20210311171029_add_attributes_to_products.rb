class AddAttributesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :attributes, :json, default: {}
  end
end
