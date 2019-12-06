class CreateBrands < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
      t.text :content
      t.string :image
      t.text :address
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
