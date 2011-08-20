class UploadResumeForMtech < ActiveRecord::Migration
  def self.up
     add_column :mtech_students, :resume_file_name,    :string
     add_column :mtech_students, :resume_content_type, :string
     add_column :mtech_students, :resume_file_size,    :integer
     add_column :mtech_students, :resume_updated_at,   :datetime
   end

   def self.down
     remove_column :mtech_students, :resume_file_name
     remove_column :mtech_students, :resume_content_type
     remove_column :mtech_students, :resume_file_size
     remove_column :mtech_students, :resume_updated_at
   end
end
