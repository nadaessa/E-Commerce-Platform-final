class Order < ApplicationRecord
  enum state: [:Pending, :Confirmed, :Delivered]
  belongs_to :cart
  has_many :carts
  has_many :order_items
  has_many :products, through: :order_items
end
