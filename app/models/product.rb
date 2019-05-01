class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  belongs_to :user
  has_many :cart_items
  has_many :carts, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items
end
