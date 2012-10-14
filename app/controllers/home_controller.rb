class HomeController < ApplicationController
  
  def index
      @notices= Notice.all
      @dashboards=Dashboard.all 
  @company=[]
     # @company=Company.all
 Company.all.each do |comp|
  if comp.academic_year1 == 2012  && comp.academic_year2 ==  2013 #changed
       	@company << comp
end
end 
  end

  def edits
        @us = User.find(params[:id])

        @x=@us.username
        $xs=@us.role

        @user=User.new(:username=>@x,:role=>$xs)
  end
  
  
  def update_password
      @user=User.new(params[:user])
      @user.role=$xs
      @users=User.find_by_username(@user.username)
      
      if @users.destroy
          if @user.save
            flash[:notice]='password changed successfully'
             redirect_to(:controller=>'home',:action=>'index')
          else
            render(:controller=>'home',:action=>'edits')
          end
      else
        flash[:notice]='unknown username'
         redirect_to(:controller=>'home',:action=>'index')
      end   
  end
  def about_us
  end
  
  def password
    
  end
  
  def check_user
      
    @user=User.find_by_username(params[:username])
    @c=false
    if @user.present?
       if @user.role=="student"
         @s= Student.find_by_reg_no(@user.username)
       elsif  @user.role=="mca_student"
         @s= McaStudent.find_by_reg_no(@user.username)
       elsif @user.role=="mtech_student"
         @s= MtechStudent.find_by_reg_no(@user.username)
       else
         flash[:notice]="You are not a student! cant move forward"
         redirect_to(:action  => 'password')
         return
       end
        
       if @s.dob.to_s == params[:dob]
        
         redirect_to(:action  => 'security',:id=>@user.id, :check=>@s )
       else
         flash[:notice]= "Incorrect details"
         render(:action  => 'password')
       end
       
    else
      flash[:notice]="Invalid username"
      redirect_to(:action  => 'password')
    end

  end
  
  def security
    if params[:id].blank? or params[:check].blank?
      redirect_to(:action  => 'index')
    else
      @user=User.find(params[:id])
         if @user.role=="student"
           @s= Student.find_by_reg_no(@user.username)
         elsif  @user.role=="mca_student"
           @s= McaStudent.find_by_reg_no(@user.username)
         else @user.role=="mtech_student"
           @s= MtechStudent.find_by_reg_no(@user.username)
         end
    end
  end
  
  def check_security
      if params[:value]== params[:answer]
        @user=User.find(params[:id])
        @pass=Password.find_by_username(params[:name])
        if @pass.blank?
          @cre=Password.create(:username=>@user.username)
        end  
          redirect_to(:action  => 'edits',:id=>@user.id)
        
      else
        flash[:notice]='Wrong answer!'
        redirect_to(:action  => 'password')
      end
        
  end
  
  def show_placed_students
 @company_list1 = []
 @company_list = []

   @y1=params[:academic_year1]
   @y2=params[:academic_year2]
   @year1=@y1.to_i
   @year2=@y2.to_i
  #@company=Company.find_by_cmp_name(params[:company])
@branch = Branch.find_by_branch_name(params[:branch])
@company_list1 = @branch.companies
@company_list1.each do |comp|
if comp.academic_year1 == @year1 && comp.academic_year2 == @year2
 @company_list << comp
end
end
#@company_students = []
@students=[]
   
  end


def show_placed_mtech_students
 @company_list1 = []
 @company_list = []

 @y1=params[:academic_year1]
@y2=params[:academic_year2]
@year1=@y1.to_i
@year2=@y2.to_i
  #@company=Company.find_by_cmp_name(params[:company])
@branch = PgBranch.find_by_branch_name(params[:branch])
@company_list1 = @branch.pg_companies
@company_list1.each do |comp|
if comp.academic_year1 == @year1 && comp.academic_year2 == @year2
 @company_list << comp
end
end
@students=[]
end

  
 def show_placed_mca_students
 @company_list = []
 @y1=params[:academic_year1]
@y2=params[:academic_year2]
@year1=@y1.to_i
@year2=@y2.to_i
  #@company=Company.find_by_cmp_name(params[:company])
@branch = PgBranch.find_by_branch_name("MCA")
@company_list = @branch.pg_companies
@students=[]
end
  def show_companies_per_branch
     @branch = []
     @branch=params[:branch_id]
     @branch_companies = [] 


  end
def intermediate_func4
@branch=Branch.all
@branch_name=[]
  @branch.each do |bname|
    @branch_name << bname.branch_name
  end
end
def intermediate_func5
@branch=PgBranch.all
@branch_name=[]
  @branch.each do |bname|
     if bname.branch_name != "MCA"
        @branch_name << bname.branch_name
    end
  end
end

# For graphs





 
 def graph_branch_placement
   @number_of_placed_students = []
   
   @year1 = params[:academic_year1]
   @year2 = params[:academic_year2]	

   # iterate over all the branches present
   Branch.all.each do |branch|
     count_number_of_students_placed = 0 # Temporary variable to be used to count the number of student placed in a branch
     # iterate over all the students present in that branch
     branch.students.each do |stu|
       if stu.placed? && (stu.academic_year1 == @year1.to_i && stu.academic_year2 == @year2.to_i )# Check whether that particular student has been placed or not
         count_number_of_students_placed += 1 # If placed increase the counter by 1
       end
     end
     # Push the counter value in an array. So that it's stored for particular branch
     @number_of_placed_students << count_number_of_students_placed
   end
 end
 
 
 def graph_branch_company
  @year1 = params[:academic_year1]
   @year2 = params[:academic_year2]	

   count_student_placed = 0
   company_temp_array = []
   placed_student_count_temp_array = []
   @company_final_array = []
   @placed_student_final_array = []
   
   # Iterate over all the branches
   Branch.all.each do |branch|
     
     # Iterate over all the companies coming for that branch
     branch.companies.each do |company|
       
       # Store all the names of company in an temporary
          if  company.academic_year1==@year1.to_i && company.academic_year2==@year2.to_i
              company_temp_array << company.cmp_name
          
         # Iterate over all the students of that company 
            company.students.each do |student|
         
         # Check wheteher the student branch id matches with the branch id of the starting loop and whether that student is placed
         if student.branch_id == branch.id && StudentRegistration.find_by_student_id_and_company_id(student.id,company.id).placed? && (student.academic_year1 == @year1.to_i && student.academic_year2 == @year2.to_i) 
           # If placed increase the counter by 1
            count_student_placed += 1 
         end
        
       end # company.students ends

        placed_student_count_temp_array << count_student_placed #Push the total number of students placed in that company in an array
        count_student_placed = 0
end
     end
     @company_final_array << company_temp_array # Store all the names of the company that came for a branch in an array
     @placed_student_final_array << placed_student_count_temp_array # Store all the number of students placed per company per branch in an array
     
     # Re-assign the temporary arrays to blank
     company_temp_array = []
     placed_student_count_temp_array = []
   end
   
   
   @number_of_placed_students = []
   
   Branch.all.each do |branch|
     
     count_number_of_students_placed = 0
     branch.students.each do |stu|
       if stu.placed? && stu.academic_year1 == @year1.to_i && stu.academic_year2 == @year2.to_i 
         count_number_of_students_placed += 1
       end
     end
     @number_of_placed_students << count_number_of_students_placed # Needed to display in the first graph. The total number of students placed per branch
   end
   
 end
 
 def company_wise_placement
  @year1 = params[:academic_year1]
   @year2 = params[:academic_year2]
   @company_list = []
   @student_list = []
   @total_companies = 0
   count = 0
   @all_count = 0
   # iterate over the list of companies
   Company.all.each do |company|
   if company.academic_year1 == @year1.to_i  && company.academic_year2 ==  @year2.to_i #changed
       	@company_list << company
          # iterate over the all the students of the company
     company.students.each do |student|
       if StudentRegistration.find_by_student_id_and_company_id(student.id, company.id).placed? && (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i) 
         count += 1 # if student is placed increase the counter 
         @all_count +=1
       end
     end

     #store the number of students placed for that company
     @student_list << count
     count = 0

  end
  end #changed
   @total_companies = @company_list.count
   
 end

 
 def marks_distribution
 @year1 = params[:academic_year1]
   @year2 = params[:academic_year2]	
   count_less_675 = 0
   count_above_675 = 0
   count_above_725 = 0
   count_above_775 = 0
   count_above_825 = 0
   count_above_875 = 0    
   
   @count_less_675 = []
   @count_above_675 = []
   @count_above_725 = []
   @count_above_775 = []
   @count_above_825 = []
   @count_above_875 = []
       
   Branch.all.each do |branch|
     count_less_675  = 0
     count_above_675 = 0
     count_above_725 = 0
     count_above_775 = 0
     count_above_825 = 0
     count_above_875 = 0  
     if !branch.students.empty? 
  
             branch.students.each do |student|
	       if student.cgpa < 6.75 && (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i)  # && (student.puc >= 60 || student.diploma>=60 )
                 count_less_675 += 1
               end
               if student.cgpa >= 6.75 &&  (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i)  # && (student.puc >= 60 || student.diploma>=60 )
                 count_above_675 += 1
               end
                     
               if student.cgpa >= 7.25 &&  (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i) # && (student.puc >= 60 || student.diploma>=60 )
                 count_above_725 += 1
               end
               
               if student.cgpa >= 7.75 &&  (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i)  # && (student.puc >= 60 || student.diploma>=60 )
                 count_above_775 += 1
               end
      
               if student.cgpa >= 8.25 &&  (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i)  # && (student.puc >= 60 || student.diploma>=60 )
                 count_above_825 += 1
               end
               
               if student.cgpa >= 8.75 &&  (student.academic_year1 == @year1.to_i && student.academic_year2 ==  @year2.to_i)  #&& (student.puc >= 60 || student.diploma>=60 )
                 count_above_875 += 1
               end
             end
	    
             @count_less_675 << count_less_675
             @count_above_675 << count_above_675
             @count_above_725 << count_above_725
             @count_above_775 << count_above_775
             @count_above_825 << count_above_825
             @count_above_875 << count_above_875
     else
           @count_less_675 << 0
           @count_above_675 << 0
           @count_above_725 << 0
           @count_above_775 << 0
           @count_above_825 << 0
           @count_above_875 << 0
     end  
   end
 end 
end



