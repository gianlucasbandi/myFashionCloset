class CreateOutfits < ActiveRecord::Migration[7.0]
  def change
    create_table :outfits do |t|
      t.string :name
      t.string :description
      t.belongs_to :creator, foreign_key: true

      t.timestamps
    end
  end
end
