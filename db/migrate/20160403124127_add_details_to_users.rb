class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :jobs, :string
    add_column :users, :money, :float
  end
end
