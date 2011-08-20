class EventsGuests < ActiveRecord::Migration
  def self.up
     create_table :events_guests, :id=> false do |t|
        t.integer :event_id
        t.integer :guest_id
        t.timestamps
     end
     add_index :events_guests,[:event_id,:guest_id]  
   end

   def self.down
     drop_table :events_guests
   end
end
