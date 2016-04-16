class AddProfilePicToUser < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture, :text
  end
end
