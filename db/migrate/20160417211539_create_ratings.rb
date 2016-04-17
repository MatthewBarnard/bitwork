class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
t.integer :rating_from
t.integer :rating_to
t.text :comment
t.integer :rating
      t.timestamps null: false
    end
    add_foreign_key :ratings, :users, column: :rating_from
    add_foreign_key :ratings, :users, column: :rating_to
  end
end
