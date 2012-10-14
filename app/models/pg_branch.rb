class PgBranch < ActiveRecord::Base
  has_many :mtech_students
  has_many :mca_students
  has_and_belongs_to_many :pg_companies
  
  
  
  validates_presence_of :branch_name,:message=>"can't be blank"
  validates_length_of :branch_name,:maximum=>255, :message => "can't be more than 255 characters"
  validates_presence_of :dream_option,:message=>"can't be blank"
  validates_numericality_of :dream_option, :less_than_or_equal_to=>10.0, :greater_than_or_equal_to=>0.0, :message=>"is not valid"
  
end