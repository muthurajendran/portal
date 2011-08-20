class PgCompany < ActiveRecord::Base
    
    has_and_belongs_to_many :pg_branches
    has_many :mtech_student_registrations
    has_many :mtech_students,:through => :mtech_student_registrations
    has_many :mca_students_registrations
    has_many :mca_students,:through => :mca_students_registrations
   
    # belongs_to :placement_search


    # Company name validation

     validates_presence_of :cmp_name, :message=>"can't be blank"
     validates_length_of :cmp_name, :maximum=>255, :message => "can't have more than 255 characters"
     validates_uniqueness_of :cmp_name, :message => "has already been taken"

     # Company Sslc, Puc, Diploma validations

     validates_numericality_of :sslc, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to=>0.0, :message=>"marks are not valid"
     validates_presence_of :sslc, :message => "can't be blank"

     validates_numericality_of :puc, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
     validates_numericality_of :diploma, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
     validates_numericality_of :degree, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid" 
     validates_numericality_of :mtech_be_cgpa, :less_than_or_equal_to => 10.0, :greater_than_or_equal_to =>0.0, :message => "is not valid"
     validates_numericality_of :mtech_be_per, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
     
     
     validates_numericality_of :mtech_cgpa,  :less_than_or_equal_to => 10.0, :greater_than_or_equal_to => 0, :message => "is not valid"
     validates_numericality_of :mca_cgpa,  :less_than_or_equal_to => 10.0, :greater_than_or_equal_to => 0, :message => "is not valid"
   
     # Company salary validation

      validates_numericality_of :salary, :greater_than_or_equal_to => 0.0, :allow_blank => true, :message => "is not valid" 
   
     # Company Backlog's criteria

     validates_presence_of :backlogs, :message => "can't be blank"
     validates_numericality_of :backlogs, :greater_than_or_equal_to=> 0, :only_integer => true, :message => "is not valid"

  end
