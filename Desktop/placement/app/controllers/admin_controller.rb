class AdminController < ApplicationController
  
  before_filter :admin_user
  def index
    @user=User.new
   end
  def students_registrations
    @company=Company.all
    @students=[]
  end 
 
 # Logic-- When a student is placed in a service based company his "count" attribute changes to 1 and if she/he's placed in core company it changes to 2
 
 
  def update_placed_and_remove_ineligible
     @remove_service_or_core=[]
     @student=StudentRegistration.find_by_student_id_and_company_id(params[:id][0],params[:id][1])
     @student_main = Student.find_by_id(params[:id][0])

     if @student.update_attributes(:placed => true) && @student_main.update_attributes(:placed => true)
     flash[:notice]= "#{Student.find_by_id(params[:id][0]).name} is placed in #{Company.find_by_id(params[:id][1]).cmp_name}"
     
     # Find the company time in which the student has been placed 
     if Company.find_by_id(params[:id][1]).company_type == "CORE"
       @student_main.update_attributes(:placed_company_type => 2 )
     elsif Company.find_by_id(params[:id][1]).company_type == "SERVICE"
       @student_main.update_attributes(:placed_company_type => 1 )
     end
     
     @remove_service_or_core=StudentRegistration.where("student_id = ?",params[:id][0])
     if  Company.find_by_id(params[:id][1]).company_type=="SERVICE"

        @remove_service_or_core.each do |remove_service|
           if Company.find_by_id(remove_service.company_id).company_type=="SERVICE" && remove_service.company_id != Company.find_by_id(params[:id][1]).id 
               StudentRegistration.find_by_student_id_and_company_id(params[:id][0],remove_service.company_id).destroy
           end
        end
        if Student.find_by_id(params[:id][0]).cgpa < Branch.find_by_id(Student.find_by_id(params[:id][0]).branch_id).dream_option

          @remove_service_or_core.each do |remove_core|
           if Company.find_by_id(remove_core.company_id).company_type=="CORE"  
               StudentRegistration.find_by_student_id_and_company_id(params[:id][0],remove_core.company_id).destroy
           end
          end
        end 
     elsif Company.find_by_id(params[:id][1]).company_type=="CORE"

          @remove_service_or_core.each do |remove_service_and_core|

          if(remove_service_and_core.company_id != Company.find_by_id(params[:id][1]).id)

             StudentRegistration.find_by_student_id_and_company_id(remove_service_and_core.student_id,remove_service_and_core.company_id).destroy
          end
        end
     end
     redirect_to(:action => 'students_registrations')
     return  
     end
  end 
  
  
  
  def update_unplaced
    @student=StudentRegistration.find_by_student_id_and_company_id(params[:id][0],params[:id][1])
    @student_main = Student.find_by_id(params[:id][0])
    if @student.update_attributes(:placed => false)  && @student_main.update_attributes(:placed => false)
       flash[:notice]= "#{Student.find_by_id(params[:id][0]).name} is removed from  #{Company.find_by_id(params[:id][1]).cmp_name}"
       redirect_to(:action => 'students_registrations')
    return
      end
  end
  
  
  def mca_students_registrations
     @pg_company=PgCompany.all
    @mca_students=[]
   end
    def mtech_students_registrations
       @pg_company=PgCompany.all
    @students=[]
    end
  
  
  # For Mtech
  
  def update_placed_and_remove_ineligible_for_mtech
     @remove_service_or_core=[]
     @student = MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(params[:id][0],params[:id][1])
     @student_main =MtechStudent.find_by_id(params[:id][0])

     if @student.update_attributes(:placed => true) && @student_main.update_attributes(:placed => true)
     flash[:notice]= "#{MtechStudent.find_by_id(params[:id][0]).name} is placed in #{PgCompany.find_by_id(params[:id][1]).cmp_name}"
     
     # Find the company time in which the student has been placed 
     if PgCompany.find_by_id(params[:id][1]).pg_company_type == "CORE"
       @student_main.update_attributes(:placed_company_type => 2 )
     elsif PgCompany.find_by_id(params[:id][1]).pg_company_type == "SERVICE"
       @student_main.update_attributes(:placed_company_type => 1 )
     end
     
     @remove_service_or_core=MtechStudentRegistration.where("mtech_student_id = ?",params[:id][0])
     if PgCompany.find_by_id(params[:id][1]).pg_company_type=="SERVICE"

        @remove_service_or_core.each do |remove_service|
           if PgCompany.find_by_id(remove_service.pg_company_id).pg_company_type=="SERVICE" && remove_service.pg_company_id != PgCompany.find_by_id(params[:id][1]).id 
               MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(params[:id][0],remove_service.pg_company_id).destroy
           end
        end
        if MtechStudent.find_by_id(params[:id][0]).mtech_cgpa < PgBranch.find_by_id(MtechStudent.find_by_id(params[:id][0]).pg_branch_id).dream_option

          @remove_service_or_core.each do |remove_core|
           if PgCompany.find_by_id(remove_core.pg_company_id).pg_company_type=="CORE"  
               MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(params[:id][0],remove_core.pg_company_id).destroy
           end
          end
        end 
     elsif PgCompany.find_by_id(params[:id][1]).pg_company_type=="CORE"
          #@ex="hello"
          @remove_service_or_core.each do |remove_service_and_core|

          if(remove_service_and_core.pg_company_id != PgCompany.find_by_id(params[:id][1]).id)

             MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(remove_service_and_core.mtech_student_id,remove_service_and_core.pg_company_id).destroy
          end
        end
     end
     redirect_to(:action => 'mtech_students_registrations')
     return  
     end
  end
  
  
  def update_unplaced_for_mtech
     @student = MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(params[:id][0],params[:id][1])
     @student_main = MtechStudent.find_by_id(params[:id][0])
     if @student.update_attributes(:placed => false)  && @student_main.update_attributes(:placed => false)
       flash[:notice]= "#{MtechStudent.find_by_id(params[:id][0]).name} is removed from  #{PgCompany.find_by_id(params[:id][1]).cmp_name}"
       redirect_to(:action => 'mtech_students_registrations')
     return
     end
  end
  
  
  
 # For MCA
 
 
 def update_placed_and_remove_ineligible_for_mca
     @remove_service_or_core=[]
     @student = McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(params[:id][0],params[:id][1])
     @student_main =McaStudent.find_by_id(params[:id][0])

     if @student.update_attributes(:placed => true) && @student_main.update_attributes(:placed => true)
     flash[:notice]= "#{McaStudent.find_by_id(params[:id][0]).name} is placed in #{PgCompany.find_by_id(params[:id][1]).cmp_name}"
     
     # Find the company time in which the student has been placed 
     if PgCompany.find_by_id(params[:id][1]).pg_company_type == "CORE"
       @student_main.update_attributes(:placed_company_type => 2 )
     elsif PgCompany.find_by_id(params[:id][1]).pg_company_type == "SERVICE"
       @student_main.update_attributes(:placed_company_type => 1 )
     end
     
     @remove_service_or_core=McaStudentsRegistration.where("mca_student_id = ?",params[:id][0])
     if PgCompany.find_by_id(params[:id][1]).pg_company_type=="SERVICE"

        @remove_service_or_core.each do |remove_service|
           if PgCompany.find_by_id(remove_service.pg_company_id).pg_company_type=="SERVICE" && remove_service.pg_company_id != PgCompany.find_by_id(params[:id][1]).id 
               McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(params[:id][0],remove_service.pg_company_id).destroy
           end
        end
        if McaStudent.find_by_id(params[:id][0]).mca_cgpa < PgBranch.find_by_id(McaStudent.find_by_id(params[:id][0]).pg_branch_id).dream_option

          @remove_service_or_core.each do |remove_core|
           if PgCompany.find_by_id(remove_core.pg_company_id).pg_company_type=="CORE"  
               McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(params[:id][0],remove_core.pg_company_id).destroy
           end
          end
        end 
     elsif PgCompany.find_by_id(params[:id][1]).pg_company_type=="CORE"
          #@ex="hello"
          @remove_service_or_core.each do |remove_service_and_core|

          if(remove_service_and_core.pg_company_id != PgCompany.find_by_id(params[:id][1]).id)

             McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(remove_service_and_core.mca_student_id,remove_service_and_core.pg_company_id).destroy
          end
        end
     end
     redirect_to(:action => 'mca_students_registrations')
     return  
     end
  end 
  
  
  
   def update_unplaced_for_mca
     @student = McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(params[:id][0],params[:id][1])
     @student_main = McaStudent.find_by_id(params[:id][0])
     if @student.update_attributes(:placed => false)  && @student_main.update_attributes(:placed => false)
       flash[:notice]= "#{McaStudent.find_by_id(params[:id][0]).name} is removed from  #{PgCompany.find_by_id(params[:id][1]).cmp_name}"
       redirect_to(:action => 'mca_students_registrations')
     return
     end
  end
  
 
  def create_account
    
  end
  
end