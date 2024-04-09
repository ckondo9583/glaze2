class Tag < ApplicationRecord
  has_many :tag_relation, dependent: :destroy
  has_many :calculation, through: :tag_relation
  
end
