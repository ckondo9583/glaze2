class Tag < ApplicationRecord
     has_many :tag_relations
     has_many :calculations, through: :tag_relations
end
