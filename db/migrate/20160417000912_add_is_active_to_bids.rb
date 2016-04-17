class AddIsActiveToBids < ActiveRecord::Migration
  def change
    add_column :bids, :is_active, :boolean, :default => true
  end
end
