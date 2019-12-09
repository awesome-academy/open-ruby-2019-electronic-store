class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :detail
      t.string :image
      t.string :keyword
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
