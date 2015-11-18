class AddBidMinimumBid < ActiveRecord::Migration
  def change
  	add_column :bids, :minimum_bid, :integer
  end
end
