class AddColumnsToStudents < ActiveRecord::Migration
  def self.up
     add_column :students, :question, :string
     add_column :students, :answer, :string
     add_column :students, :question_set, :boolean, :default => false
     
     add_column :mca_students, :question, :string
     add_column :mca_students, :answer, :string
     add_column :mca_students, :question_set, :boolean, :default => false
      
     add_column :mtech_students, :question, :string
     add_column :mtech_students, :answer, :string
     add_column :mtech_students, :question_set, :boolean, :default => false
   end

   def self.down
     remove_column :students, :question
     remove_column :students, :answer 
     remove_column :students, :question_set
    
      remove_column :mca_students, :question
      remove_column :mca_students, :answer 
      remove_column :mca_students, :question_set
      
       remove_column :mtech_students, :question
       remove_column :mtech_students, :answer 
       remove_column :mtech_students, :question_set
   end
end

