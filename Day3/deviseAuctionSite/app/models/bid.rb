class Bid < ActiveRecord::Base
	belongs_to :user
	belongs_to :product
	# validates :amount, presence: true
	# validates :amount, bid: true
end
