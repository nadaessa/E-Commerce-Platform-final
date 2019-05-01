class OrderItem < ApplicationRecord
  enum state: [:Pending, :Confirmed, :Delivered]
  belongs_to :order
  belongs_to :product
end
