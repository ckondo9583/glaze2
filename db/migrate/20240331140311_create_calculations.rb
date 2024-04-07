class CreateCalculations < ActiveRecord::Migration[6.1]
  def change
    create_table :calculations do |t|
      t.integer :user_id, null: false
      t.integer :temperature
      t.integer :tag_id
      t.text :memo
      t.string :image
      t.integer :release_status, null: false, default: 0
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

      t.integer :fukushimafeldspar
      t.integer :lithiumcarbonate
      t.integer :magnesite
      t.integer :whitelimestone
      t.integer :strontiumcarbonate
      t.integer :bariumcarbonate
      t.integer :zincoxide
      t.integer :kaolin
      t.integer :fukushimasilica


      t.timestamps
    end
  end
end
