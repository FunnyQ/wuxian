class ChangeUserLevelColumn < ActiveRecord::Migration
  def change
    remove_column :users, :level, :integer, null: false, default: 1
    add_column :users, :hot_level, :integer, null: false, default: 0
    add_column :users, :rich_level, :integer, null: false, default: 0
    add_column :users, :friend_level, :integer, null: false, default: 0
    add_column :users, :push_level, :integer, null: false, default: 0
  end
end
