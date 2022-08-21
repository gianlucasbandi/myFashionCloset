class CreateCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :creators do |t|
      t.string :firstName
      t.string :lastName
      t.date :birthday
      t.string :gender
      t.string :styleDesc
      t.boolean :approved

      t.timestamps
    end
  end
end
