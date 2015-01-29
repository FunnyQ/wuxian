class AddNewUserToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_new_user, :boolean, default: true
  end
end
