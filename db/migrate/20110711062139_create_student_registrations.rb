class CreateStudentRegistrations < ActiveRecord::Migration
  def self.up
    create_table :student_registrations do |t|
      t.integer :company_id
      t.integer :student_id
      t.boolean :placed,:default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :student_registrations
  end
end

