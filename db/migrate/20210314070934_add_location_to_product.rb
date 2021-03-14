class AddLocationToProduct < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :location, index: true, foreign_key: true
  end
end
