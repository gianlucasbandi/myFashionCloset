class AddControllerIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :creator ,null: true
  end
end
