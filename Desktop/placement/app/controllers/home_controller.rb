class HomeController < ApplicationController
  
  def index
      @notices= Notice.all
      @dashboards=Dashboard.all 
      @company=Company.all 
  end
  
  def about_us
  end
  
  def show_placed_students
    @company_list = []
    
    @branch = Branch.find_by_id(params[:id])
    #@company_students = []
    
    @company_list = @branch.companies
    @students=[]
   
  end
  
  def show_companies_per_branch
     @branch = Branch.find_by_id(params[:id])
     @branch_companies = []
     @branch_companies = @branch.companies
  end
 
 def graph_branch_placement
   @number_of_placed_students = []
   
   # iterate over all the branches present
   Branch.all.each do |branch|
     count_number_of_students_placed = 0 # Temporary variable to be used to count the number of student placed in a branch
     # iterate over all the students present in that branch
     branch.students.each do |stu|
       if stu.placed? # Check whether that particular student has been placed or not
         count_number_of_students_placed += 1 # If placed increase the counter by 1
       end
     end
     # Push the counter value in an array. So that it's stored for particular branch
     @number_of_placed_students << count_number_of_students_placed
   end
 end
 
 
 def graph_branch_company
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
       company_temp_array << company.cmp_name
       
       # Iterate over all the students of that company 
       company.students.each do |student|
         
         # Check wheteher the student branch id matches with the branch id of the starting loop and whether that student is placed
         if student.branch_id == branch.id && student.placed?
           # If placed increase the counter by 1
            count_student_placed += 1 
         end

       end # company.students ends
        placed_student_count_temp_array << count_student_placed #Push the total number of students placed in that company in an array
        count_student_placed = 0
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
       if stu.placed?
         count_number_of_students_placed += 1
       end
     end
     @number_of_placed_students << count_number_of_students_placed # Needed to display in the first graph. The total number of students placed per branch
   end
   
 end
 
 def company_wise_placement
   @company_list = []
   @student_list = []
   @total_companies = 0
   count = 0
   @all_count = 0
   # iterate over the list of companies
   Company.all.each do |company|
     @company_list << company
     # iterate over the all the students of the company
     company.students.each do |student|
       if student.placed?
         count += 1 # if student is placed increase the counter 
         @all_count +=1
       end
     end
     #store the number of students placed for that company
     @student_list << count
     count = 0
   end
   @total_companies = @company_list.count
   
 end
 
 
 
 def marks_distribution
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
               if student.cgpa < 6.75 && (student.puc >= 60 || student.diploma>=60 )
                 count_less_675 += 1
               end
               if student.cgpa >= 6.75 && (student.puc >= 60 || student.diploma>=60 )
                 count_above_675 += 1
               end
                     
               if student.cgpa >= 7.25 && (student.puc >= 60 || student.diploma>=60 )
                 count_above_725 += 1
               end
               
               if student.cgpa >= 7.75 && (student.puc >= 60 || student.diploma>=60 )
                 count_above_775 += 1
               end
      
               if student.cgpa >= 8.25 && (student.puc >= 60 || student.diploma>=60 )
                 count_above_825 += 1
               end
               
               if student.cgpa >= 8.75 && (student.puc >= 60 || student.diploma>=60 )
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
