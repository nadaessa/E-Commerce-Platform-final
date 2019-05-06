class Store < ApplicationRecord

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "must be character format" }
  validates :summary, presence: true, format: { with: /\A[a-zA-Z]+\z/,
  message: "must be character format" }

  validates :user_id, presence: true

  belongs_to :user
  has_many :products
end
