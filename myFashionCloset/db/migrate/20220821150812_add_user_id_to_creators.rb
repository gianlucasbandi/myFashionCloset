class AddUserIdToCreators < ActiveRecord::Migration[7.0]
  def change
    add_reference :creators, :user, foreign_key: true
    add_foreign_key :creators, :users
  end
end
