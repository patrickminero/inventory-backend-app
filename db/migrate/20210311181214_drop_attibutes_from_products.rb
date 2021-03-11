class DropAttibutesFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :attributes
  end
end
