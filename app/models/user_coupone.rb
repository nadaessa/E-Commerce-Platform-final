class UserCoupone < ApplicationRecord
  belongs_to :coupone
  belongs_to :user
end
