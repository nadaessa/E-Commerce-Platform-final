class Coupone < ApplicationRecord

    enum coupone_type: [:fixed, :discount]
    enum expiration_type: [:time, :no_of_usage]
    enum status: [:available, :unvailable]

    has_many :user_coupones 
    has_many :users, through: :user_coupones

    validates :coupone_type, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "you must select an option" }
    validates :value, presence: true

    validates :expiration_type, presence: true
    
    validates :code, presence: true
    validates :status, presence: true

end
