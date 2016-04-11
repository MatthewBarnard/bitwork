class Add < ActiveRecord::Migration
  def change
    add_column :bids, :comment, :text
  end
end
