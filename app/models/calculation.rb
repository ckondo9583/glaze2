class Calculation < ApplicationRecord
  belongs_to :user
  enum release_status: { confine: 0, release: 1 }
end