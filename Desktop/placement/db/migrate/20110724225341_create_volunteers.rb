class CreateVolunteers < ActiveRecord::Migration
  def self.up
     create_table :volunteers do |t|
       t.string :v_name
       t.string :v_usn
       t.integer :v_sem
       t.string :v_branch
       t.string :v_mob 
       t.string :v_email
       t.timestamps
     end
   end

   def self.down
     drop_table :volunteers
   end
end
