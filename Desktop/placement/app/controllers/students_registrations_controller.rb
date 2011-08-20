class StudentsRegistrationsController < ApplicationController
  # GET /student_registrations
  # GET /student_registrations.xml

  def index
    @student= Student.find_by_reg_no(current_user.username)
    @branch=Branch.find(@student.branch_id)
    @companies = @branch.companies
    @test=$ineligible
        respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_registrations }
    end
  end
  
  
  def register
   @error_messages=[]
    @student = Student.find_by_reg_no(current_user.username)
    @company=Company.find(params[:id])
    @gap = @company.gap_in_edu
     if @gap == -1
       @gap = Student.maximum('gap_in_edu')
     end   
    
    
        if @student.sslc>=@company.sslc && (@student.puc>=@company.puc || @student.diploma >=@company.diploma) && @student.dob >= @company.dob && @student.gap_in_edu <= @gap && @student.active_backlog <=@company.backlogs && @student.cgpa>=@company.cgpa && Time.now<=@company.reg_date+1              
               @student_registrations= StudentRegistration.new(:company_id=>@company.id,:student_id=>@student.id,:placed=>false)
                        
                        if  @student_registrations.save
                            
                            flash[:notice]  = "Successfully Registered"    
                            redirect_to(:action => 'index')
                            return
                        else
                                  flash[:notice]  =  'Error Occured'
                                  redirect_to('public/error.html')
    
                        end   
                       
         else
            
            if Time.now>@company.reg_date
                @error_messages << "Registrations are closed"
            else
                  if @student.sslc<@company.sslc
                     @error_messages << "SSLC Marks" 
                  end
                  
                  if @student.puc<@company.puc 
                      @error_messages << "PUC Marks"
                  end 
                 
                  if @student.active_backlog >@company.backlogs
                      @error_messages << "Active Backlogs"
                  end
                  if @student.cgpa < @company.cgpa
                      @error_messages << "CGPA"
                  end
                  if @student.dob<@company.dob
                    @error_messages << "DOB"
                  end
                  
            end
            if !@error_messages.nil?
              flash[:notice] = "Sorry you are not eligible because following Company Criteria were not being satisfied: \n #{@error_messages}"
            end
            
            redirect_to(:action => 'index')
            return
         end        
       end  
 
   def unregister
    
    @student = Student.find_by_reg_no(current_user.username)
    @student_registrations= StudentRegistration.find_by_student_id_and_company_id(@student.id,params[:id])
    
    if @student_registrations.destroy
    flash[:notice] = 'Sucessfully Unregistered'
    redirect_to(:action => 'index')
    return
    else
      flash[:notice] = 'Some Error occured !! Try again!!!'
    end
  end
  
  def display_criterion
    @company=Company.find_by_id(params[:id])
  end
  
  def show_others
    
     @placed_students = []
     # gives the Company Selected
     @cmp = Company.find_by_id(params[:id])
    
    # Check for Registration in that company   
     if @cmp.students.nil?
       @no_registrations = true
     else
       # Loops through every student registered for that company
        @cmp.students.each do |stu|
          # Finds whether the student has been Placed of not
          if stu.placed?
            @placed_students << stu
          else
            @not_placed = true
          end
        end
     end

  end
end