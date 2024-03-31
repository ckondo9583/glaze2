class CreatePublicFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :public_favorites do |t|

      t.timestamps
    end
  end
end
