class CreatePublicComments < ActiveRecord::Migration[6.1]
  def change
    create_table :public_comments do |t|

      t.timestamps
    end
  end
end
