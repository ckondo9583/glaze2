class CreateTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_relations do |t|
      t.integer :tag_id, null: false
      t.integer :calculation_id, null: false
      t.timestamps
    end
  end
end
