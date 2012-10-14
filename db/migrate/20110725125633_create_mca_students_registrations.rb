class CreateMcaStudentsRegistrations < ActiveRecord::Migration
  def self.up
    create_table :mca_students_registrations do |t|
        t.integer :pg_company_id
        t.integer :mca_student_id
        t.boolean :placed,:default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :mca_students_registrations
  end
end