class AddAcceptToBids < ActiveRecord::Migration
  def change
    add_column :bids, :is_accepted, :boolean
  end
end
