class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :description
      t.integer :viewed, default: 0
      t.integer :photo_count, default: 0
      t.integer :cover_id
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
