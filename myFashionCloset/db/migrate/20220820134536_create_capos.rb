class CreateCapos < ActiveRecord::Migration[7.0]
  def change
    create_table :capos do |t|
      t.string :immagine
      t.string :nome
      t.string :descrizione

      t.timestamps
    end
  end
end
