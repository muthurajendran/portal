class CreateBranches < ActiveRecord::Migration
  def self.up
    
    create_table :branches do |t|

       t.string :branch_name , :unique => true
       t.decimal :dream_option, :precision=>4, :scale => 2
       t.timestamps
    end
    
  end

  def self.down
    drop_table :branches
  end
end
