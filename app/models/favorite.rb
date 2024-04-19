class Favorite < ApplicationRecord
  belongs_to :calculation
  belongs_to :user
end
