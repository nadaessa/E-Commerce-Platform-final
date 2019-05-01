class Coupone < ApplicationRecord
    enum type: [:fixed, :discount]
    enum expiration_type: [:time, :no_of_usage]
    enum status: [:valid, :unvalid]
end
