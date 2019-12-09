class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end