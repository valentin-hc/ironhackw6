class CreateJoinTableUserBarbecue < ActiveRecord::Migration
  def change
    create_join_table :users, :barbecues do |t|
      t.index [:user_id, :barbecue_id]
      t.index [:barbecue_id, :user_id]
    end
  end
end
