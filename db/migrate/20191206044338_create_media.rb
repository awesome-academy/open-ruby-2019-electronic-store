class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.string :link
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
