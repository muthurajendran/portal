class CreatePgBranches < ActiveRecord::Migration
  def self.up
    create_table :pg_branches do |t|
       t.string :branch_name , :unique => true
       t.decimal :dream_option, :precision=>4, :scale => 2
      t.timestamps
    end
  end

  def self.down
    drop_table :pg_branches
  end
end