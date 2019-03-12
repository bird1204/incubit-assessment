class AddIndexOnUsernameAtMembers < ActiveRecord::Migration[5.2]
  def change
    add_index :members, :username
  end
end
