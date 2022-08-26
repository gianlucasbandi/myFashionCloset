class CreateGuardarobas < ActiveRecord::Migration[7.0]
  def change
    create_table :guardarobas do |t|
      t.integer :user_id
      t.string :immagine_capo
      t.string :nome_capo

      t.timestamps
    end
  end
end
