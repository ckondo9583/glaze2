class TagRelation < ApplicationRecord
  belongs_to :calculation
  belongs_to :tag
end
