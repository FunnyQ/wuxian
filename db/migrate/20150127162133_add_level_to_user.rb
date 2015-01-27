class AddLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :integer, null: false, default: 1
    change_column :users, :nick_name, :string, unique: true
  end
end
