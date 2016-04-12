class AddHasPaidToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :is_paid, :boolean
  end
end
