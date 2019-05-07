class Order < ApplicationRecord
  enum order_status: [:Pending, :Confirmed, :Delivered]
  belongs_to :cart
  belongs_to :country  ,optional: true
  belongs_to :city     ,optional: true
  has_many :carts
  has_many :order_items
  has_many :products, through: :order_items

end
