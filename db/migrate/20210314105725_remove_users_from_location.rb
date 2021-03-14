class RemoveUsersFromLocation < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :users
  end
end
