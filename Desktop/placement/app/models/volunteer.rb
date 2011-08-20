class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :events
  
  #validation for Name
   validates_presence_of :v_name, :message=>"can't be blank"
   validates_length_of :v_name,:maximum=>255, :message => "can't have more than 255 characters"

   #validations for USN
  
   validate do |volunteer|
    volunteer.errors.add_to_base("Register Number can't be blank") if volunteer.v_usn.blank?
    
  end  
   
   USN=/^[4][Nn][Mm][0-9][0-9][A-Za-z][A-Za-z][0-9][0-9][0-9]$/
   #validates_presence_of :reg_no, :message=>"can't be blank"
   validates_length_of :v_usn, :maximum=>10, :message => "can't be greater than 10 characters"
   validates_format_of :v_usn, :with=>USN, :message => "is not in correct format"
   validates_uniqueness_of :v_usn, :message => "has already been taken"
  
  #mobile number validation
  
  validate do |volunteer|
      volunteer.errors.add_to_base("Mobile Number can't be blank") if volunteer.v_mob.blank?
    end  
    MOBILE_VALIDATION = /^[0-9]{10}$/
    validates_format_of :v_mob, :with => MOBILE_VALIDATION, :message => " number is not in proper format"  
  #Email Validation

    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    validates_presence_of :v_email, :message => "can't be blank"
    validates_length_of :v_email, :maximum => 100, :message => "can't be more than 100 characters"
    validates_format_of :v_email, :with => EMAIL_REGEX, :message => "is not of valid format"
    validates_uniqueness_of :v_email, :message => "is already taken"
    
    

end
