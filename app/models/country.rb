class Country < ApplicationRecord
    has_many :cities
    has_many :orders
end
