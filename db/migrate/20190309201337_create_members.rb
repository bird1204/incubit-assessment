class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :email, unique: true, null: false, default: "", index: true
      t.string :password_digest, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.string :username, null: false, default: ""
      t.timestamps
    end
  end
end
