class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.text :file_data
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
