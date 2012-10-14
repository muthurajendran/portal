class Company < ActiveRecord::Base
  has_and_belongs_to_many :branches
  
  has_many :student_registrations
  
  has_many :students,:through => :student_registrations
  belongs_to :placement_search
  
  
  # Company name validation
  
   validates_presence_of :cmp_name, :message=>"can't be blank"
   validates_length_of :cmp_name,:maximum=>255, :message => "can't have more than 255 characters"
   validates_uniqueness_of :cmp_name,:scope => :academic_year1,:scope=> :academic_year2, :message => "has already been taken"
   
   # Company Sslc, Puc, Diploma validations
   
   validates_numericality_of :sslc, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to=>0.0,:allow_blank=>true ,:message=>"marks are not valid"
   #validates_presence_of :sslc, :message => "can't be blank"
   
   validates_numericality_of :puc, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
   
   validates_numericality_of :diploma, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
   
   # Company cgpa criteria
   
   validates_numericality_of :cgpa,      :less_than_or_equal_to => 10.0, :greater_than=>0, :message => "is not valid"
   validates_presence_of     :cgpa,      :message => "can't be blank"
   
   # Company salary validation
   
    validates_numericality_of :salary, :greater_than_or_equal_to => 0.0, :allow_blank => true, :message => "is not valid" 
    
    
   # Company Backlog's criteria
   
   #validates_presence_of :backlogs, :message => "can't be blank"
   validates_numericality_of :backlogs, :greater_than_or_equal_to=> 0, :only_integer => true,:allow_blank=>true,  :message => "is not valid"
   
   
   # Company  extra req and Misc validations
   
    # validate misc and Extra req
   
   
   
end