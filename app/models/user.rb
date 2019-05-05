class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   enum role: [:admin, :seller, :buyer]
   has_many :products
   has_one :store
   has_one :cart
   has_many :user_coupones 
   has_many :coupones, through: :user_coupones
 
end
