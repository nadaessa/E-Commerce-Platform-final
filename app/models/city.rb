class City < ApplicationRecord
    belongs_to :country 
    has_many :orders  
end
