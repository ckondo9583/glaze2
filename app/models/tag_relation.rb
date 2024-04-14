class TagRelation < ApplicationRecord
  belongs_to :admin
  has_many :tags
end
