class AddCategoriaSitoToCapos < ActiveRecord::Migration[7.0]
  def change
    add_column :capos, :categoria, :string
    add_column :capos, :sito, :string
  end
end
