class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.integer :user_id
      t.string :title
      t.float :payment
      t.text :description
      t.text :location
      t.boolean :is_active
      t.boolean :is_claimed
      t.integer :user_claimed_id
      t.float :user_claimed_amount
      t.datetime :date_expiry
      t.datetime :date_required
      t.timestamps null: false
    end
    add_foreign_key :adverts, :users, column: :user_id
    add_foreign_key :adverts, :users, column: :user_claimed_id
  end
end
