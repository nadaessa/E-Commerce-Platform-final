class OrderItem < ApplicationRecord
  enum status: [:Pending, :Confirmed, :Delivered]
  belongs_to :order
  belongs_to :product
end
