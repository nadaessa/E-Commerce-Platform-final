class Brand < ApplicationRecord
    has_many :products

    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
