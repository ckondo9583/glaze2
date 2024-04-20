class Calculation < ApplicationRecord
  belongs_to :user
  enum release_status: { confine: 0, release: 1 }
  has_many :tag_relations, dependent: :destroy
  has_many :tags, through: :tag_relations
  validates :title, presence: true
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited?(user)
   favorites.where(user_id: user.id).exists?
  end
  
   def soft_delete
    update(is_deleted: true)
    comments.update_all(is_deleted: true)
    # 他の関連モデルについても必要な削除処理を追加することが望ましいです
   end
  
end