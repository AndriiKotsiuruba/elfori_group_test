class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.belongs_to :collection, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
