class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :name
      t.text :content
      t.integer :status, default: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
