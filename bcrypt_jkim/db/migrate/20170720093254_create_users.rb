class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :email_address, null: false
      t.string :password_hash, null: false

      t.timestamp
    end
  end
end
