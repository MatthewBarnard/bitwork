class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :user_id
      t.integer :advert_id
      t.float :amount
      t.boolean :is_lead
      t.timestamps null: false
    end
    add_foreign_key :bids, :users, column: :user_id
    add_foreign_key :bids, :adverts, column: :advert_id
  end
end
