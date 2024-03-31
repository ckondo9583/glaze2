class CreateAdminHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_homes do |t|

      t.timestamps
    end
  end
end
