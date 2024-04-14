class Tag < ApplicationRecord
  belongs_to :tag_relation, dependent: :destroy

end
