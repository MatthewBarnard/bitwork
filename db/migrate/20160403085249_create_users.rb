class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_type
      t.string :email
      t.string :password
      t.string :full_name
      t.string :cellphone
      t.string :address
      t.integer :rating
      t.timestamps null: false
    end
  end
end
