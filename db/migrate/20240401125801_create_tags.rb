class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.integer :tag_relations_id, null: false
      t.string :tag_name, null: false
      t.timestamps
    end
  end
end
