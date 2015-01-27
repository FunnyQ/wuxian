class AddThingsToUser < ActiveRecord::Migration
  def change

    # not needed anymore, using authorization model now
    remove_column :users, :fb_id, :string, :limit => 20
    remove_column :users, :token, :string
    remove_column :users, :name, :string

    # adding basic info
    add_column :users, :real_name, :string
    add_column :users, :nick_name, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :location, :string
  end
end
