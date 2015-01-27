class AddViewedToUser < ActiveRecord::Migration
  def change
    add_column :users, :viewed, :integer, null: false, default: 1
  end
end
