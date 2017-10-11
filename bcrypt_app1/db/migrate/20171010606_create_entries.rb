class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
			t.string :body
			
      t.timestamps null: false
    end
  end
end
