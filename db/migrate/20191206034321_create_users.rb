class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.text :address
      t.string :password_digest
      t.string :remember_digest
      t.boolean :admin, default: false
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activated_at
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
