class Student < ActiveRecord::Base
   belongs_to :branch
   belongs_to :placement_search
   has_many :student_registrations
   has_many :companies, :through => :student_registrations
   has_attached_file :resume
   
  #Paperclip Resume validations
  
   validates_attachment_size :resume, :less_than => 10.megabytes, :message => "size can't be more than 10Mb"
   validates_attachment_content_type :resume, :content_type => ['application/pdf', 'application/doc', 'application/docx'], :message => "should be only of these formats: pdf,doc,docx"
   
  # before_save :destroy_resume?
   
  # def resume_delete
  #    @resume_delete ||= "0"
  # end

  # def resume_delete=(value)
  #    @resume_delete = value
  # end

  #private
  #  def destroy_resume?
  #    self.resume.clear if @resume_delete == "1"
  #  end
  
   
   #Paperclip options ends
   
   
   #validation for Name
   
   sname = /^[a-zA-Z\s]+$/
   validates_format_of :name,:with=>sname,:message=>"is invalid"
   
   validates_presence_of :name, :message=>"can't be blank"
   validates_length_of :name,:maximum=>255, :message => "can't have more than 255 characters"
   #validates_format_of :name, :with => /^[a-z]$/i, :message => "can have only alphabets"
   
   
   #validations for USN
  
   validate do |student|
    student.errors.add_to_base("Register Number can't be blank") if student.reg_no.blank?
    
  end  
   
   USN=/^[4][Nn][Mm][0-9][0-9][A-Za-z][A-Za-z][0-9][0-9][0-9]$/
   #validates_presence_of :reg_no, :message=>"can't be blank"
   validates_length_of :reg_no, :maximum=>10, :message => "can't be greater than 10 characters"
   validates_format_of :reg_no, :with=>USN, :message => "is not in correct format"
   validates_uniqueness_of :reg_no, :message => "has already been taken"
   
   
   #validation marks SSLC,PUC and Diploma
   
   validates_numericality_of :sslc, :less_than_or_equal_to=>100.0, :greater_than=>0.0, :message=>"marks are not valid"
   validates_presence_of :sslc, :message => "can't be blank"

   validates_numericality_of :puc, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
  
   validates_numericality_of :diploma, :less_than_or_equal_to=>100.0, :greater_than_or_equal_to =>0.0, :allow_blank=>true, :message => "marks are not valid"
    
   # add presence for puc or diploma
   
   
   #validations for sgpa and cgpa
   
   validates_numericality_of :sgpa_sem1, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :allow_blank=>true, :message=>"is not valid"
   validates_numericality_of :sgpa_sem2, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :allow_blank=>true, :message=>"is not valid"
   validates_numericality_of :sgpa_sem3, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :message=>"is not valid"
   validates_numericality_of :sgpa_sem4, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :message=>"is not valid"
   validates_numericality_of :sgpa_sem5, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :message=>"is not valid"
   validates_numericality_of :sgpa_sem6, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :allow_blank=>true, :message=>"is not valid"
   validates_numericality_of :sgpa_sem7, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :allow_blank=>true, :message=>"is not valid"
   validates_numericality_of :sgpa_sem8, :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :allow_blank=>true, :message=>"is not valid"
   validates_numericality_of :cgpa,      :less_than_or_equal_to=>10.0,:greater_than_or_equal_to=>0, :message=>"is not valid"
   
      
   #validates_presence_of :sgpa_sem1, :message => "can't be blank"
   #validates_presence_of :sgpa_sem2, :message => "can't be blank"
   validates_presence_of :sgpa_sem3, :message => "can't be blank"
   validates_presence_of :sgpa_sem4, :message => "can't be blank"
   validates_presence_of :sgpa_sem5, :message => "can't be blank"
   #validates_presence_of :sgpa_sem6, :message => "can't be blank"
   #validates_presence_of :sgpa_sem7, :message => "can't be blank"
   #validates_presence_of :sgpa_sem8, :message => "can't be blank"
   validates_presence_of :cgpa,      :message => "can't be blank"
   
   #Validations for Mobile
   
  # validates_numericality_of :mobile, :only_integer => true, :message => "number is not valid"
   #validates_length_of       :mobile, :maximum=>10, :message => "number is not valid"
   #validates_presence_of     :mobile, :message => "number can't be blank"
  
  #validates_numericality_of :telephone, :only_integer => true, :message => "number is not valid", :allow_blank=>true
   
   #Email Validation

    EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
    validates_presence_of :email, :message => "can't be blank"
    validates_length_of :email, :maximum => 100, :message => "can't be more than 100 characters"
    validates_format_of :email, :with => EMAIL_REGEX, :message => "is not of valid format"
    validates_uniqueness_of :email, :message => "is already taken"
    
     validates_presence_of :answer, :message => "can't be blank"
    
    #Address validation
    validates_presence_of :address, :message => "can't be empty"
    
    validate do |student|
      student.errors.add_to_base("Mobile Number can't be blank") if student.mobile.blank?
    end  
    MOBILE_VALIDATION = /^[0-9]{10}$/
    validates_format_of :mobile, :with => MOBILE_VALIDATION, :message => " number is not in proper format" 
   
end
