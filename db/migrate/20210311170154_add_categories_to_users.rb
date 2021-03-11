class AddCategoriesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :categories, :string, array:true, default: []
  end
end
