class CreateGuestbooks < ActiveRecord::Migration
  def change
    create_table :guestbooks do |t|
      t.integer :visitor_id, index: true
      t.integer :host_id, index: true

      t.timestamps null: false
    end
  end
end
