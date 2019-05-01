class Order < ApplicationRecord
  enum state: [:Pending, :Confirmed, :Delivered]
  belongs_to :cart
end
