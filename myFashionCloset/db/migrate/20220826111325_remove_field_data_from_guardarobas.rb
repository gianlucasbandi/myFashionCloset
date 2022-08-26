class RemoveFieldDataFromGuardarobas < ActiveRecord::Migration[7.0]
  def change
    remove_column :guardarobas, :created_at, :datetime
    remove_column :guardarobas, :updated_at, :datetime
  end
end
