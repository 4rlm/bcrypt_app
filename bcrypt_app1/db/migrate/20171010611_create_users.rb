class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
			t.string :email
			t.string :pw_hash
			
      t.timestamps null: false
    end
  end
end