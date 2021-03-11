class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :category
      t.string :subcategory
      t.string :sku
      t.boolean :variable
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
