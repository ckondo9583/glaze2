class CreateAdminComments < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_comments do |t|

      t.timestamps
    end
  end
end
