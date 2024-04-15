class TagRelation < ApplicationRecord
  belongs_to :tag
  belongs_to :calculation
end
