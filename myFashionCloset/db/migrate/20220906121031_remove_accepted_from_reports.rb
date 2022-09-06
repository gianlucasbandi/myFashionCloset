class RemoveAcceptedFromReports < ActiveRecord::Migration[7.0]
  def change
    remove_column :reports, :accepted, :boolean
  end
end
