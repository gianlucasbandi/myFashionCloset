class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.string :about
      t.string :description
      t.integer :user_id, null: false
      t.integer :creator_id, null: false

      t.timestamps
      
    end
    add_foreign_key :reports, :users, column: :user_id
    add_foreign_key :reports, :creators, column: :creator_id
  end
end
