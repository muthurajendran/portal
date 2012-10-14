class CreateMtechStudentRegistrations < ActiveRecord::Migration
  def self.up
    create_table :mtech_student_registrations do |t|
       t.integer :pg_company_id
        t.integer :mtech_student_id
        t.boolean :placed,:default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :mtech_student_registrations
  end
end