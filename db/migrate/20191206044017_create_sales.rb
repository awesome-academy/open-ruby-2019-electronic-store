class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.string :name
      t.integer :price_sale
      t.integer :status, default: 1
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
