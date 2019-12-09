class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :decription
      t.string :image
      t.integer :quantity
      t.integer :price
      t.integer :discount
      t.integer :hot
      t.integer :popular
      t.string :keyword
      t.integer :status, default: 1
      t.references :brand, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
