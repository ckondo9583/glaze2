class CreatePublicCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :public_calculations do |t|

      t.timestamps
    end
  end
end
