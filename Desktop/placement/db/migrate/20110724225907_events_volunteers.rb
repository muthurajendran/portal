class EventsVolunteers < ActiveRecord::Migration
  def self.up
     create_table :events_volunteers, :id=> false do |t|
     t.integer :event_id
     t.integer :volunteer_id
     t.timestamps
     end  
      add_index :events_volunteers,[:event_id,:volunteer_id]  
  end

  def self.down
     drop_table :events_volunteers
  end
end
