class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.references :user, index: true
      t.string :title
      t.text :content
      t.string :featured_img
      t.integer :viewed, null: false, default: 1
      t.string :location

      t.timestamps null: false
    end
    add_foreign_key :diaries, :users
  end
end
