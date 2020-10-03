class CreateNodes < ActiveRecord::Migration[5.2]
  def change
    create_table :nodes do |t|
      t.string :node_type
      t.text :content
      t.integer :parent_id
      t.string :name

      t.timestamps
    end
  end
end
