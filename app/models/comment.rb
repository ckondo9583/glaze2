class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :calculation
end
