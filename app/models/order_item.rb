class OrderItem < ApplicationRecord
  enum state: [:Pending, :Confirmed, :Delivered]
  belongs_to :cart
  belongs_to :product
end
