class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :creator_id

      t.timestamps null: false
    end
    add_index :follows, :user_id
    add_index :follows, :creator_id
    add_index :follows, [:user_id, :creator_id], unique: true
  end
end
