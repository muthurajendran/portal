class MtechStudentRegistrationsController < ApplicationController

  #filter_resource_access
    # GET /student_registrations
    # GET /student_registrations.xml

    def index
      @mtech_student= MtechStudent.find_by_reg_no(current_user.username)
      @pgbranch=PgBranch.find(@mtech_student.pg_branch_id)
      @pg_companies = @pgbranch.pg_companies
      @test=$ineligible
          respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @mtech_student_registrations }
      end
    end


    def register

      @mtech_student = MtechStudent.find_by_reg_no(current_user.username)
      @pg_company=PgCompany.find(params[:id])
      @error_messages=[]
      @gap = @pg_company.gap_in_edu
      if @gap == -1
          @gap = MtechStudent.maximum('gap_in_edu')
      end   
      
      if @mtech_student.sslc>=@pg_company.sslc && (@mtech_student.puc>=@pg_company.puc || @mtech_student.diploma >=@pg_company.diploma) &&(@mtech_student.mtech_be_per>=@pg_company.mtech_be_per || @mtech_student.mtech_be_cgpa >=@pg_company.mtech_be_cgpa) && @mtech_student.dob >= @pg_company.dob && @mtech_student.gap_in_edu <= @gap && @mtech_student.active_backlog <=@pg_company.backlogs && @mtech_student.mtech_cgpa>=@pg_company.mtech_cgpa && Time.now<=@pg_company.reg_date+1              
         @mtech_student_registrations= MtechStudentRegistration.new(:pg_company_id=>@pg_company.id,:mtech_student_id=>@mtech_student.id,:placed=>false)

                          if  @mtech_student_registrations.save

                              flash[:notice]  = "Successfully Registered"    
                              redirect_to(:action => 'index')
                              return
                          else
                                    flash[:notice]  =  'Error Occured'
                                    redirect_to('public/error.html')

                          end   

           else

                    if Time.now>@pg_company.reg_date
                        @error_messages << "Registrations are closed"
                    else
                          if @mtech_student.sslc<@pg_company.sslc
                              @error_messages << "SSLC Marks" 
                          end
                          
                       
                        
                          if @mtech_student.gap_in_edu > @gap
                            @error_messages << "Gap in Education"
                          end
                        
                          if @mtech_student.active_backlog > @pg_company.backlogs
                              @error_messages << "Active Backlogs"
                          end
                          
                          if @mtech_student.mtech_cgpa<@pg_company.mtech_cgpa
                              @error_messages << "CGPA"
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

      @mtech_student = MtechStudent.find_by_reg_no(current_user.username)
      @mtech_student_registrations= MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(@mtech_student.id,params[:id])

      if @mtech_student_registrations.destroy
      flash[:notice] = 'Sucessfully Unregistered'
      redirect_to(:action => 'index')
      return
      else
        flash[:notice] = 'Some Error occured !! Try again!!!'
      end
    end

    def display_criterion
      @pg_company=PgCompany.find_by_id(params[:id])
    end
    
def show_others
    
     @placed_students = []
     # gives the Company Selected
     @cmp = PgCompany.find_by_id(params[:id])
    
    # Check for Registration in that company   
     if @cmp.mtech_students.nil?
       @no_registrations = true
     else
       # Loops through every student registered for that company
        @cmp.mtech_students.each do |stu|
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