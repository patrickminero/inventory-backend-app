class AddUserToLocation < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :users, :string, array: true, default: []
  end
end
