class AddCreatToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :creat, :boolean
  end
end
