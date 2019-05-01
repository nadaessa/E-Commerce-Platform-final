class Product < ApplicationRecord
  belongs_to :store
  belongs_to :category
  belongs_to :brand
  belongs_to :user
end
