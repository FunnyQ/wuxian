class CreateGuestbooks < ActiveRecord::Migration
  def change
    create_table :guestbooks do |t|
      t.integer :visitor_id
      t.integer :host_id

      t.timestamps null: false
    end
  end
end
