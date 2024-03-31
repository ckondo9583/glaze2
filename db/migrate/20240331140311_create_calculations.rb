class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|

      t.integer :user_id, null: false
      t.string :calculations, default: "" 
      t.integer :temperature
      t.text :memo
      t.string :image
      t.integer :release_status, null: false
      t.datetime :burning_date
      t.integer :knao
      t.integer :li2o
      t.integer :mgo
      t.integer :cao
      t.integer :sro
      t.integer :bao
      t.integer :zno
      t.integer :al203
      t.integer :sios
      t.integer :amount
      
      t.timestamps
    end
  end
end
