class CreatePasswords < ActiveRecord::Migration
  def self.up
       create_table :passwords do |t|
         t.string :username
         t.boolean :check_name, :default=>false
         t.boolean :check_question, :default=>false
         t.timestamps
       end
  end

  def self.down
    drop_table :passwords
  end

end
