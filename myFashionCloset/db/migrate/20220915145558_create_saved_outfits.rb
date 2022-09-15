class CreateSavedOutfits < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_outfits do |t|
      t.integer :user_id, null: false
      t.integer :outfit_id, null: false

      t.timestamps
    end
  end
end
