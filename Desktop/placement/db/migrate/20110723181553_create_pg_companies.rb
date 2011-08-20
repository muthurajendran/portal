class CreatePgCompanies < ActiveRecord::Migration
  def self.up
    create_table :pg_companies do |t|
      t.string :cmp_name,:unique => true
      t.date   :dob
      t.decimal :sslc,:precision => 5,:scale => 2
      t.decimal :degree,:precision => 5,:scale => 2
      t.decimal :puc,:precision => 5,:scale => 2
      t.decimal :diploma,:precision => 5,:scale => 2
      t.integer :backlogs
      t.integer :gap_in_edu
      t.decimal :mtech_be_per,:precision => 5,:scale => 2
      t.decimal :mtech_be_cgpa,:precision => 4,:scale => 2
      t.decimal :mtech_cgpa,:precision => 4,:scale => 2
       t.decimal :mca_cgpa,:precision => 4,:scale => 2
      t.date :reg_date
      t.date :preplacement_talk
      t.date :test_date
      t.date :interview_date
      t.decimal :salary
      t.string :pg_company_type
      t.text :extra_req
      t.text :misc
      t.integer :total_backlog

      t.timestamps
    end
  end

  def self.down
    drop_table :pg_companies
  end
end
