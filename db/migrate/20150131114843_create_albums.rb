class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.integer :viewed
      t.integer :photo_count
      t.integer :cover_id

      t.timestamps null: false
    end
  end
end
