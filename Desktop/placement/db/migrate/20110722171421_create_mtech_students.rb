class CreateMtechStudents < ActiveRecord::Migration
  def self.up
    create_table :mtech_students do |t|
       t.string  :name,:limit=>40
        t.date    :dob
        t.string  :reg_no,:limit => 10,:unique => true
        t.integer :sem
        t.integer :pg_branch_id
        t.integer :academic_year1
        t.integer :academic_year2
        t.decimal :sslc,:precision=>5,:scale => 2
        t.decimal :puc,:precision=>5,:scale => 2
        t.decimal :diploma,:precision=>5,:scale => 2
         t.decimal :mtech_be_per,:precision=>5,:scale => 2
        t.decimal :mtech_be_cgpa,:precision=>4,:scale => 2
        t.decimal :mtech_cgpa,:precision=>4,:scale => 2
        t.integer :gap_in_edu
        t.decimal :sgpa_sem1,:precision=>4,:scale => 2
        t.decimal :sgpa_sem2,:precision=>4,:scale => 2
        t.decimal :sgpa_sem3,:precision=>4,:scale => 2
        t.decimal :sgpa_sem4,:precision=>4,:scale => 2
        #t.decimal :mtech_cgpa,:precision=>4,:scale => 2
        t.integer :active_backlog
        t.integer :total_backlogs
        t.string :telephone
        t.string :mobile
        t.string :email
        t.text :address
        t.boolean :placed, :default => false
        t.integer :placed_company_type, :default => 0

      t.timestamps
    end
    add_index(:mtech_students,:pg_branch_id)
     add_index(:mtech_students,:reg_no)
     add_index(:mtech_students,:sem)
  end

  def self.down
    drop_table :mtech_students
  end
end