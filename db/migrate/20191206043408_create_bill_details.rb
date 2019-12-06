class CreateBillDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_details do |t|
      t.integer :quantity
      t.integer :total_price
      t.references :bill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
