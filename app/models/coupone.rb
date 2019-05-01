class Coupone < ApplicationRecord
    enum type: [:fixed, :discount]
    enum expiration_type: [:time, :no_of_usage]
    enum status: [:valid, :unvalid]

    has_many :user_coupones 
    has_many :users, through: :user_coupones
end
