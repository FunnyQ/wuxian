class AddViewedToUser < ActiveRecord::Migration
  def change
    add_column :users, :viewed, :integer, null: false, default: 0
  end
end
