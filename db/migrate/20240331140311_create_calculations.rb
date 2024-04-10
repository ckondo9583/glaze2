class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.integer :user_id, null: false
      t.integer :temperature
      t.integer :tag_id
      t.text :memo
      t.string :image
      t.text :title, null: false
      t.text :subtitle
      t.integer :release_status, null: false, default: 0
      t.datetime :burning_date
      t.string :knao
      t.string :li2o
      t.string :mgo
      t.string :cao
      t.string :sro
      t.string :bao
      t.string :zno
      t.string :al203
      t.string :sios
      t.string :amount
      t.string :fukushimafeldspar
      t.string :lithiumcarbonate
      t.string :magnesite
      t.string :whitelimestone
      t.string :strontiumcarbonate
      t.string :bariumcarbonate
      t.string :zincoxide
      t.string :kaolin
      t.string :fukushimasilica
      t.string :additive1
      t.string :additive2
      t.string :additive3
      t.string :additive4
      t.string :additive5
      t.string :additive1_amount
      t.string :additive2_amount
      t.string :additive3_amount
      t.string :additive4_amount
      t.string :additive5_amount


      t.timestamps
    end
  end
end
