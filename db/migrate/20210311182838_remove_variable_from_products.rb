class RemoveVariableFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :variable
  end
end
