class CreateOutfitsCaposJoinTable < ActiveRecord::Migration[7.0]
  def change
    # This is enough; you don't need to worry about order
    #create_join_table :outfits, :capos

    # If you want to add an index for faster querying through this join:
    create_join_table :outfits, :capos do |t|
      t.index :outfit_id
      t.index :capo_id
    end

  end
end
