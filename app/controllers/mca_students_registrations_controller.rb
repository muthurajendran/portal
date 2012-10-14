class McaStudentsRegistrationsController < ApplicationController

#filter_resource_access
  
    # GET /student_registrations
    # GET /student_registrations.xml

    def index
      @mca_student= McaStudent.find_by_reg_no(current_user.username)
      @pgbranch=PgBranch.find(@mca_student.pg_branch_id)

      @comps = @pgbranch.pg_companies
      @pg_companies = @comps.where("academic_year1 = ? and academic_year2 = ?",@mca_student.academic_year1, @mca_student.academic_year2)

      @test=$ineligible
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @mca_student_registrations }
      end
    end


     def register

        @mca_student = McaStudent.find_by_reg_no(current_user.username)
        @pg_company=PgCompany.find(params[:id])
        @error_messages=[]
        @gap = @pg_company.gap_in_edu
        if @gap == -1
             @gap = McaStudent.maximum('gap_in_edu')
        end   

        if @mca_student.sslc >= @pg_company.sslc && (@mca_student.puc >= @pg_company.puc || @mca_student.diploma >= @pg_company.diploma) && @mca_student.degree > @pg_company.degree && @mca_student.mca_cgpa >= @pg_company.mca_cgpa && @mca_student.dob >= @pg_company.dob && @mca_student.gap_in_edu <= @gap && @mca_student.active_backlog <= @pg_company.backlogs && Time.now<=@pg_company.reg_date+1              
         
         @mca_student_registrations= McaStudentsRegistration.new(:pg_company_id => @pg_company.id, :mca_student_id => @mca_student.id, :placed=>false)

                if  @mca_student_registrations.save
                    flash[:notice]  = "Successfully Registered"    
                    redirect_to(:action => 'index')
                    return
                else
                          flash[:notice]  =  'Error Occured'
                          redirect_to('public/error.html')

                end   

        else

              if Time.now > @pg_company.reg_date
                @error_messages << "Registrations are closed"
              else
                    if @mca_student.sslc<@pg_company.sslc
                        @error_messages << "SSLC Marks" 
                    end
                    
                   
                    if @mca_student.degree < @pg_company.degree
                      @error_messages << "Degree Marks"
                    end 
                   
                    if @mca_student.active_backlog >@pg_company.backlogs
                      @error_messages << "Active Backlogs"
                    end
                    
                    if @mca_student.mca_cgpa < @pg_company.mca_cgpa
                        @error_messages << "CGPA"
                    end
                    
                    if @mca_student.gap_in_edu > @gap
                        @error_messages << "Gap in Education"
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

          @mca_student = McaStudent.find_by_reg_no(current_user.username)
          @mca_student_registrations= McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(@mca_student.id,params[:id])
    
          if @mca_student_registrations.destroy
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
  end
