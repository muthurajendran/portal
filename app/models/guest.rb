class Guest < ActiveRecord::Base
  has_and_belongs_to_many :events
   #validation for Name
   validates_presence_of :guest_name, :message=>"can't be blank"
   validates_length_of :guest_name,:maximum=>255, :message => "can't have more than 255 characters"

  
  #mobile number validation
  
  validate do |guest|
      guest.errors.add_to_base("Mobile Number can't be blank") if guest.guest_mob.blank?
    end  
    MOBILE_VALIDATION = /^[0-9]{10}$/
    validates_format_of :guest_mob, :with => MOBILE_VALIDATION, :message => " number is not in proper format"  
  
  #Email Validation

    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    validates_presence_of :guest_email, :message => "can't be blank"
    validates_length_of :guest_email, :maximum => 100, :message => "can't be more than 100 characters"
    validates_format_of :guest_email, :with => EMAIL_REGEX, :message => "is not of valid format"
    validates_uniqueness_of :guest_email, :message => "is already taken"
    
end
