class User < ActiveRecord::Base
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://static5.businessinsider.com/image/511d104a69bedd1f7c000012/grumpy-cat-definitely-did-not-make-100-million.jpg"
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	has_many :products, dependent: :destroy 
	has_many :bids, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
end
