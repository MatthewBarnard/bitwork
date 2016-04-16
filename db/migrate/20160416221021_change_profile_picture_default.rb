class ChangeProfilePictureDefault < ActiveRecord::Migration
  def change
    change_column :users, :profile_picture, :text, :default => 'default.png'
  end
end
