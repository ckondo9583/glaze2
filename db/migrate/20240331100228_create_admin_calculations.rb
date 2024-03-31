class CreateAdminCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_calculations do |t|

      t.timestamps
    end
  end
end
