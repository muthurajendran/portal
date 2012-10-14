class CreateEvents < ActiveRecord::Migration
  def self.up
     create_table :events do |t|
        t.string :event_name
        t.date :event_date
        t.string :event_venue
        t.text  :event_details
        t.timestamps
      end
   end

   def self.down
     drop_table :events
   end
end
