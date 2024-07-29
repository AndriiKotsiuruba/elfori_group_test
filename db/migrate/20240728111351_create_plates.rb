class CreatePlates < ActiveRecord::Migration[6.1]
  def change
    create_table :plates do |t|
      t.string :title
      t.integer :order
      t.belongs_to :collection, null: true, foreign_key: true, index: true

      t.timestamps
    end
  end
end
