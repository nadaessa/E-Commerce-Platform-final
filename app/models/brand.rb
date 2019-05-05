class Brand < ApplicationRecord
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
    has_many :products
end
