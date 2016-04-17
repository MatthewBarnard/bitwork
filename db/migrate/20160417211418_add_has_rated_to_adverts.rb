class AddHasRatedToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :has_rated, :boolean, :default => false
  end
end
