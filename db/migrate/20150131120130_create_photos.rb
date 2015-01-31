class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :file
      t.references :album, index: true
      t.integer :viewed

      t.timestamps null: false
    end
    add_foreign_key :photos, :albums
  end
end
