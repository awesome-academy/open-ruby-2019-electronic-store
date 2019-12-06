class CreateAdvertises < ActiveRecord::Migration[6.0]
  def change
    create_table :advertises do |t|
      t.string :image
      t.string :name
      t.text :decription
      t.integer :status, default: 1
      t.integer :price_sale
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
