class AddUrlToGuardarobas < ActiveRecord::Migration[7.0]
  def change
    add_column :guardarobas, :url, :string
    add_column :guardarobas, :sito, :string
  end
end
