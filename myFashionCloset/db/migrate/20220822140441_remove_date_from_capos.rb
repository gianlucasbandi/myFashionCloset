class RemoveDateFromCapos < ActiveRecord::Migration[7.0]
  def change
    remove_column :capos, :created_at, :datetime
    remove_column :capos, :updated_at, :datetime
  end
end
