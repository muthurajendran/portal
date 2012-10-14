class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
       t.string  :guest_name
       t.integer :guest_mob
       t.string  :guest_email
       t.string :guest_details
       t.string :guest_role
       t.timestamps
     end
  end

  def self.down
    drop_table :guests
  end
end
