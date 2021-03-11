class AddSubcategoriesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :subcategories, :string, array:true, default: []
  end
end
