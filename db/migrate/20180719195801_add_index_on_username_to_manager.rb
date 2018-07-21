class AddIndexOnUsernameToManager < ActiveRecord::Migration[5.2]
  def change
    add_index :managers, :username, unique: true
  end
end
