class CreatePublicUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :public_users do |t|

      t.timestamps
    end
  end
end
