class Calculation < ApplicationRecord
  belongs_to :user
  enum release_status: { confine: 0, release: 1 }
  has_many :tag_relation, dependent: :destroy
  has_many :tags, through: :tag_relation
  validates :title, presence: true
end