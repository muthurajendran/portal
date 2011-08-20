# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110725164432) do

  create_table "branches", :force => true do |t|
    t.string   "branch_name"
    t.decimal  "dream_option", :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches_companies", :id => false, :force => true do |t|
    t.integer  "branch_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches_companies", ["branch_id", "company_id"], :name => "index_branches_companies_on_branch_id_and_company_id"

  create_table "companies", :force => true do |t|
    t.string   "cmp_name"
    t.date     "dob"
    t.decimal  "sslc",              :precision => 5,  :scale => 2
    t.decimal  "puc",               :precision => 5,  :scale => 2
    t.decimal  "diploma",           :precision => 5,  :scale => 2
    t.integer  "backlogs"
    t.integer  "total_backlogs"
    t.integer  "gap_in_edu"
    t.decimal  "cgpa",              :precision => 4,  :scale => 2
    t.date     "reg_date"
    t.date     "preplacement_talk"
    t.date     "test_date"
    t.date     "interview_date"
    t.decimal  "salary",            :precision => 10, :scale => 0
    t.string   "company_type"
    t.text     "extra_req"
    t.text     "misc"
    t.integer  "total_backlog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", :force => true do |t|
    t.string   "dash_head"
    t.string   "board"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.string   "event_name"
    t.date     "event_date"
    t.string   "event_venue"
    t.text     "event_details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_guests", :id => false, :force => true do |t|
    t.integer  "event_id"
    t.integer  "guest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_guests", ["event_id", "guest_id"], :name => "index_events_guests_on_event_id_and_guest_id"

  create_table "events_volunteers", :id => false, :force => true do |t|
    t.integer  "event_id"
    t.integer  "volunteer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events_volunteers", ["event_id", "volunteer_id"], :name => "index_events_volunteers_on_event_id_and_volunteer_id"

  create_table "guests", :force => true do |t|
    t.string   "guest_name"
    t.integer  "guest_mob"
    t.string   "guest_email"
    t.string   "guest_details"
    t.string   "guest_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mca_students", :force => true do |t|
    t.string   "name",                :limit => 40
    t.date     "dob"
    t.string   "reg_no",              :limit => 10
    t.integer  "sem"
    t.integer  "pg_branch_id"
    t.integer  "academic_year1"
    t.integer  "academic_year2"
    t.decimal  "sslc",                              :precision => 5, :scale => 2
    t.decimal  "puc",                               :precision => 5, :scale => 2
    t.decimal  "degree",                            :precision => 5, :scale => 2
    t.decimal  "diploma",                           :precision => 5, :scale => 2
    t.decimal  "mca_cgpa",                          :precision => 4, :scale => 2
    t.integer  "gap_in_edu"
    t.decimal  "sgpa_sem1",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem2",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem3",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem4",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem5",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem6",                         :precision => 4, :scale => 2
    t.integer  "active_backlog"
    t.integer  "total_backlogs"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.text     "address"
    t.boolean  "placed",                                                          :default => false
    t.integer  "placed_company_type",                                             :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "mca_students", ["pg_branch_id"], :name => "index_mca_students_on_pg_branch_id"
  add_index "mca_students", ["reg_no"], :name => "index_mca_students_on_reg_no"
  add_index "mca_students", ["sem"], :name => "index_mca_students_on_sem"

  create_table "mca_students_registrations", :force => true do |t|
    t.integer  "pg_company_id"
    t.integer  "mca_student_id"
    t.boolean  "placed",         :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mtech_student_registrations", :force => true do |t|
    t.integer  "pg_company_id"
    t.integer  "mtech_student_id"
    t.boolean  "placed",           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mtech_students", :force => true do |t|
    t.string   "name",                :limit => 40
    t.date     "dob"
    t.string   "reg_no",              :limit => 10
    t.integer  "sem"
    t.integer  "pg_branch_id"
    t.integer  "academic_year1"
    t.integer  "academic_year2"
    t.decimal  "sslc",                              :precision => 5, :scale => 2
    t.decimal  "puc",                               :precision => 5, :scale => 2
    t.decimal  "diploma",                           :precision => 5, :scale => 2
    t.decimal  "mtech_be_per",                      :precision => 5, :scale => 2
    t.decimal  "mtech_be_cgpa",                     :precision => 4, :scale => 2
    t.decimal  "mtech_cgpa",                        :precision => 4, :scale => 2
    t.integer  "gap_in_edu"
    t.decimal  "sgpa_sem1",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem2",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem3",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem4",                         :precision => 4, :scale => 2
    t.integer  "active_backlog"
    t.integer  "total_backlogs"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.text     "address"
    t.boolean  "placed",                                                          :default => false
    t.integer  "placed_company_type",                                             :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "mtech_students", ["pg_branch_id"], :name => "index_mtech_students_on_pg_branch_id"
  add_index "mtech_students", ["reg_no"], :name => "index_mtech_students_on_reg_no"
  add_index "mtech_students", ["sem"], :name => "index_mtech_students_on_sem"

  create_table "notices", :force => true do |t|
    t.string   "nhead"
    t.string   "nbody"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_branches", :force => true do |t|
    t.string   "branch_name"
    t.decimal  "dream_option", :precision => 4, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pg_branches_pg_companies", :id => false, :force => true do |t|
    t.integer  "pg_company_id"
    t.integer  "pg_branch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pg_branches_pg_companies", ["pg_branch_id", "pg_company_id"], :name => "index_pg_branches_pg_companies_on_pg_branch_id_and_pg_company_id"

  create_table "pg_companies", :force => true do |t|
    t.string   "cmp_name"
    t.date     "dob"
    t.decimal  "sslc",              :precision => 5,  :scale => 2
    t.decimal  "degree",            :precision => 5,  :scale => 2
    t.decimal  "puc",               :precision => 5,  :scale => 2
    t.decimal  "diploma",           :precision => 5,  :scale => 2
    t.integer  "backlogs"
    t.integer  "gap_in_edu"
    t.decimal  "mtech_be_per",      :precision => 5,  :scale => 2
    t.decimal  "mtech_be_cgpa",     :precision => 4,  :scale => 2
    t.decimal  "mtech_cgpa",        :precision => 4,  :scale => 2
    t.decimal  "mca_cgpa",          :precision => 4,  :scale => 2
    t.date     "reg_date"
    t.date     "preplacement_talk"
    t.date     "test_date"
    t.date     "interview_date"
    t.decimal  "salary",            :precision => 10, :scale => 0
    t.string   "pg_company_type"
    t.text     "extra_req"
    t.text     "misc"
    t.integer  "total_backlog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "placement_searches", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_registrations", :force => true do |t|
    t.integer  "company_id"
    t.integer  "student_id"
    t.boolean  "placed",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", :force => true do |t|
    t.string   "name",                :limit => 40
    t.date     "dob"
    t.string   "reg_no",              :limit => 10
    t.integer  "sem"
    t.integer  "branch_id"
    t.string   "gender"
    t.integer  "academic_year1"
    t.integer  "academic_year2"
    t.decimal  "sslc",                              :precision => 5, :scale => 2
    t.decimal  "puc",                               :precision => 5, :scale => 2
    t.decimal  "diploma",                           :precision => 5, :scale => 2
    t.integer  "gap_in_edu"
    t.decimal  "sgpa_sem1",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem2",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem3",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem4",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem5",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem6",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem7",                         :precision => 4, :scale => 2
    t.decimal  "sgpa_sem8",                         :precision => 4, :scale => 2
    t.decimal  "cgpa",                              :precision => 4, :scale => 2
    t.integer  "active_backlog"
    t.integer  "total_backlogs"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.text     "address"
    t.boolean  "placed",                                                          :default => false
    t.integer  "placed_company_type",                                             :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  add_index "students", ["branch_id"], :name => "index_students_on_branch_id"
  add_index "students", ["reg_no"], :name => "index_students_on_reg_no"
  add_index "students", ["sem"], :name => "index_students_on_sem"

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "volunteers", :force => true do |t|
    t.string   "v_name"
    t.string   "v_usn"
    t.integer  "v_sem"
    t.string   "v_branch"
    t.string   "v_mob"
    t.string   "v_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
