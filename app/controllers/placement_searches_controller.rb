$student1
$company3
class PlacementSearchesController < ApplicationController
 
  # filter_resource_access
  def index
    
  end
  
  def show
   if $select==0
    @student = Student.find(params[:id])
  elsif $select==1
   @student = MtechStudent.find(params[:id])
 else
   @student = McaStudent.find(params[:id])
  end
  end
  
  def show_company
   if $select==0
    @company = Company.find(params[:id])
   else
    @company = PgCompany.find(params[:id])
  end
  end
  
  
   def query
   if(params[:type_options] == "B.E")
     $select=0
     elsif(params[:type_options] == "M.Tech")
     $select=1
     elsif(params[:type_options] == "MCA")
     $select=2
     end
       if      params[:query_options] == "Search by Name,USN and Branch"
             redirect_to(:action => 'usn')
       elsif   params[:query_options] == "Search by Branch and other details"
             redirect_to(:action => 'other')  
       elsif    params[:query_options] == "Search by company name and other details"
         redirect_to(:action => 'company')
       elsif    params[:query_options] == "Search by Registration Details"
         redirect_to(:action => 'registration')     
    end
  end

 
  def usn
    
  end
  
  def other
    
  end
  
  def company
    
  end
  
  def result1

    @students =[]
    @branch_array = []
    @branch_ids=[]
    @flag=0
    @students2 =[]
@c=params[:c]
@c1=@c.to_i

    if params[:branch_id].nil?
        if   params[:name] == "" && params[:reg_no] == "" 
             flash[:notice] = "Enter/Select Something"
             redirect_to(:action => 'usn')
        elsif params[:name] ==""
            if $select ==0
             @students = Student.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
             elsif $select==1
             @students = MtechStudent.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
            else
             @students = McaStudent.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
            end
        elsif (params[:reg_no]=="")
             if $select ==0
             @students = Student.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
             elsif $select==1
             @students = MtechStudent.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
            else
             @students = McaStudent.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
            end
	
        elsif !(params[:name] =="" && params[:reg_no] == "")
           if $select ==0
             @students = Student.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
             elsif $select==1
             @students = MtechStudent.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
            else
             @students = McaStudent.where("reg_no = ? and academic_year1 = ? and academic_year2 = ?",params[:reg_no].squish, params[:Academic_Year1], params[:Academic_Year2])
            end
        end
         $student1=[]
         $student1=@students   
     else  
         @flag=1
         @st = []
        if $select != 2
           params[:branch_id].each do |s|
            if $select== 0
            @branch_array << Student.where("branch_id = ? and academic_year1 = ? and academic_year2 = ? ", s, params[:Academic_Year1], params[:Academic_Year2])
            
            elsif $select == 1
            @branch_array << MtechStudent.where("pg_branch_id = ? and academic_year1 = ? and academic_year2 = ?", s, params[:Academic_Year1], params[:Academic_Year2])
            end
         end
         else
           @branch_array << McaStudent.where("academic_year1 = ? and academic_year2 = ?", params[:Academic_Year1], params[:Academic_Year2])
         end   
         
         @branch_array.each do |b|
           
            if params[:name] =="" && params[:reg_no] == "" 
                     unless b.empty?
                         @students << b
                     end
            elsif   params[:name] ==""
                  @temp = b.where("reg_no = ?",params[:reg_no].squish)
                  unless @temp.empty?
                        @students << @temp
                     end 
                  
            elsif (params[:reg_no]=="")
                  @temp = b.where("name like ?","%#{params[:name].squish}%")
                  unless @temp.empty?
                        @students << @temp
                  end
            elsif  !(params[:name] =="" && params[:reg_no] == "")
              
                  @temp = b.where("name like ? and reg_no = ?","%#{params[:name].squish}%",params[:reg_no].squish)
                  unless @temp.empty?
                        @students << @temp
                  end 
            end 
          $student1=[]
            if @students
              @students.each do |s|
                s.each do |excel|
                  $student1<< excel
                end
              end
            end 
     end     
    end
  end
  
 def result2
@c=params[:c]
@c1=@c.to_i
     @default=0
     @default1=101
      
     @students =[]
     if params[:sslc].blank?
       params[:sslc]=@default
     end
     #if params[:puc].blank?
     #  params[:puc]=@default1
     #end
     #if params[:diploma].blank?
      # params[:diploma]=@default1
     #end
     if params[:diploma].blank? && params[:puc].blank?
        params[:diploma]=@default
	params[:puc]=@default
     elsif params[:diploma].blank? && !params[:puc].blank?
        params[:diploma]=@default1
     else
        params[:puc]=@default1
     end
    if $select ==1
        if params[:beper].blank? && params[:becgpa].blank?
        params[:beper]=@default
	params[:becgpa]=@default
     elsif params[:beper].blank? && !params[:becgpa].blank?
        params[:beper]=@default
     else
        params[:becgpa]=@default
     end
    end

     if params[:cgpa].blank?
       params[:cgpa]=@default
     end
     if $select==2 && params[:degree].blank?
         params[:degree]=@default
     end
     
     if params[:gap].blank?
          if $select ==0
               params[:gap] = Student.maximum('gap_in_edu')
        elsif $select ==1
              params[:gap] = MtechStudent.maximum('gap_in_edu')
        else
              params[:gap] = McaStudent.maximum('gap_in_edu')
        end
  
     end
     
     if params[:dob].blank?
        if $select ==0
        params[:dob]=Student.minimum('dob')
        elsif $select ==1
        params[:dob]=MtechStudent.minimum('dob')
        else
        params[:dob]=McaStudent.minimum('dob') 
        end        
     end
     if params[:active_backlog].blank?
         if $select ==0
         params[:active_backlog]=Student.maximum('active_backlog')
        elsif $select ==1
         params[:active_backlog]=MtechStudent.maximum('active_backlog')
        else
         params[:active_backlog]=McaStudent.maximum('active_backlog')
        end  
       
     end

     
     if params[:total_backlogs].blank?
         if $select ==0
             params[:total_backlogs]=Student.maximum('total_backlogs')
        elsif $select ==1
            params[:total_backlogs]=MtechStudent.maximum('total_backlogs')
        else
          params[:total_backlogs]=McaStudent.maximum('total_backlogs')
        end
             

     end
     if $select ==0 || $select ==1
       if !params[:branch_id].nil?
            params[:branch_id].each do |b|
             if params[:gender]=='ALL'
               if $select ==0
               @student_branch = Student.where("branch_id = ? and academic_year1 = ? and academic_year2 = ? ",b, params[:Academic_Year1], params[:Academic_Year2])
               @temp = @student_branch.where("dob >= ? and sslc >= ? and (puc >= ? or diploma >= ?) and gap_in_edu <= ? and cgpa >= ? and active_backlog <= ? and total_backlogs <=?",params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])   
                elsif $select ==1
               @student_branch = MtechStudent.where("pg_branch_id = ? and academic_year1 = ? and academic_year2 = ? ",b, params[:Academic_Year1], params[:Academic_Year2])
               @temp = @student_branch.where("dob >= ? and sslc >= ? and (puc >= ? or diploma >= ?) and (mtech_be_per >= ? or mtech_be_cgpa >= ?) and gap_in_edu <= ? and   mtech_cgpa >= ? and active_backlog <= ? and total_backlogs <= ?",params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:beper],params[:becgpa],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])
                end   
                    unless @temp.empty?
                      @students << @temp
                    end
             else
             if $select ==0
                 @student_branch = Student.where("branch_id = ? and academic_year1 = ? and academic_year2 = ? ",b, params[:Academic_Year1], params[:Academic_Year2])
                 @temp = @student_branch.where("gender=? and dob >= ? and sslc >= ? and (puc >= ? or diploma >= ?) and gap_in_edu <= ? and cgpa >= ? and active_backlog <= ? and total_backlogs <= ?",params[:gender],params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs]) 
            elsif $select==1
               @student_branch = MtechStudent.where("pg_branch_id = ? and academic_year1 = ? and academic_year2 = ? ",b, params[:Academic_Year1], params[:Academic_Year2])
               @temp = @student_branch.where("dob >= ? and sslc >= ? and (puc >= ? or diploma >= ?) and (mtech_be_per >= ? or mtech_be_cgpa >= ?) and gap_in_edu <= ? and mtech_cgpa >= ? and active_backlog <= ? and total_backlogs <=?",params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:beper],params[:becgpa],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])
             end                 
                    unless @temp.empty?
                      @students << @temp
                    end
                        
             end 
          end
          #excel thing
          
           $student1=[]
            if @students
              @students.each do |s|
                s.each do |excel|
                  $student1<< excel
                end
              end
            end 
       else
            flash[:notice] ="Please Select a Branch"   
            redirect_to(:action => 'other')
            return
       end
    else 
         if params[:gender]=='ALL'
             @student_branch = McaStudent.where("academic_year1 = ? and academic_year2 = ? ", params[:Academic_Year1], params[:Academic_Year2])
               @temp = @student_branch.where("dob >= ? and sslc >= ? and (puc >= ? or diploma >= ?) and degree >= ? and gap_in_edu <= ? and mca_cgpa >=? and active_backlog <= ? and total_backlogs <= ?",params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:degree],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])   
                    unless @temp.empty?
                      @students << @temp
                    end
          else
               @student_branch = McaStudent.where("academic_year1 = ? and academic_year2 = ? ", params[:Academic_Year1], params[:Academic_Year2])
                @temp = @student_branch.where("dob >= ? and sslc >= ? and (puc >= ? or diploma >= ?) and degree >= ? and gap_in_edu <= ? and mca_cgpa >=? and active_backlog <= ? and total_backlogs <= ?",params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:degree],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])
                    unless @temp.empty?
                      @students << @temp
                    end
          end
         $student1=[]
            if @students
              @students.each do |s|
                s.each do |excel|
                  $student1<< excel
                end
              end
            end
     end
  end
  
  def result3
 @y1=params[:academic_year1]
 @y2=params[:academic_year2]
@year1=@y1.to_i
@year2=@y2.to_i
     @default=0
     @companies=[]
     @branch=[]
     @company_branch=[]
     @unique_array =[]
     if params[:sslc].blank?
       params[:sslc]=@default
     end
     if params[:puc].blank?
       params[:puc]=@default
     end
     if params[:diploma].blank?
       params[:diploma]=@default
     end
     if params[:cgpa].blank?
        params[:cgpa]=@default
     end
         if $select ==1
          if params[:beper].blank? 
           params[:beper]=@default
          end
          if params[:becgpa].blank?
           params[:becgpa]=@default
           end
         end
        if $select ==2 && params[:degree].blank? 
        params[:degree]=@default
        end

   
     if params[:salary].blank?
        params[:salary]=@default
     end
     if params[:gap_in_edu].blank?
        if $select ==0
        params[:gap_in_edu]=Company.maximum('gap_in_edu')
        else
        params[:gap_in_edu]=PgCompany.maximum('gap_in_edu')
        end
     end
     if params[:active_backlogs].blank?
        if $select ==0
        params[:active_backlogs]=Company.maximum('backlogs')
        else
               params[:active_backlogs]=PgCompany.maximum('backlogs')
        end

     end
     
     if params[:dob].blank?
        if $select ==0
              params[:dob]=Company.minimum('dob')
        else
             params[:dob]=PgCompany.minimum('dob')
        end
    
     end
     
     if params[:reg_date].blank?
              if $select ==0
               params[:reg_date]=Company.minimum('reg_date')
              else
              params[:reg_date]=PgCompany.minimum('reg_date')
              end
       
     end
     
     if params[:preplacement_talk].blank?
             if $select ==0
                      params[:preplacement_talk] = Company.minimum('preplacement_talk')
              else
                      params[:preplacement_talk] = PgCompany.minimum('preplacement_talk')
              end

     end
     
     if params[:test_date].blank?
          if $select ==0
       params[:test_date] = Company.minimum('test_date')
              else
       params[:test_date] = PgCompany.minimum('test_date')
              end

     end
     
     if params[:interview_date].blank?
               if $select ==0
                params[:interview_date]=Company.minimum('interview_date')
              else
    params[:interview_date]=PgCompany.minimum('interview_date')
              end
    
     end
     
     @dob=params[:dob][:year]+"-"+ params[:dob][:month]+"-"+params[:dob][:day]
     @reg_date=params[:reg_date][:year]+"-"+ params[:reg_date][:month]+"-"+params[:reg_date][:day]
     @int_date=params[:int_date][:year]+"-"+ params[:int_date][:month]+"-"+params[:int_date][:day]
     @test_date=params[:test_date][:year]+"-"+ params[:test_date][:month]+"-"+params[:test_date][:day]
      
      

      if !params[:branch_id].nil?
          params[:branch_id].each do |s|
             if $select ==0
            @branch=Branch.find_by_id(s)
              @company_branch = @branch.companies
             elsif $select==1
               @branch=PgBranch.find_by_id(s)
                @company_branch = @branch.pg_companies
             end
             
                   if params[:company_type]=="ALL"
                      if $select ==0
                   @temp=@company_branch.where("dob >= ? and sslc>=? and puc>= ? and diploma>= ? and cgpa>= ? and gap_in_edu<= ? and salary >= ? and backlogs <= ? and reg_date >= ? and test_date>= ? and interview_date >= ? and academic_year1= ? and academic_year2= ?",@dob,params[:sslc],params[:puc],params[:diploma],params[:cgpa],params[:gap_in_edu],params[:salary],params[:active_backlogs],@reg_date,@test_date,@int_date,params[:academic_year1],params[:academic_year2])
                      elsif $select ==1
                      @temp=@company_branch.where("dob >= ? and sslc>=? and puc>= ? and diploma>= ? and mtech_cgpa>= ? and mtech_be_per >= ? and mtech_be_cgpa >= ? gap_in_edu<= ? and salary >= ? and backlogs <= ? and reg_date >= ? and test_date>= ? and interview_date >= ? and academic_year1= ? and academic_year2= ?",@dob,params[:sslc],params[:puc],params[:diploma],params[:cgpa],params[:beper],params[:becgpa],params[:gap_in_edu],params[:salary],params[:active_backlogs],@reg_date,@test_date,@int_date,params[:academic_year1],params[:academic_year2])
                      end
            @companies << @temp

                 else

            @temp=@company_branch.where("dob >= ? and sslc>=? and puc>= ? and diploma>= ? and cgpa>= ? and gap_in_edu<= ? and salary >= ? and backlogs <= ? and reg_date >= ? and test_date>= ? and interview_date >= ? and academic_year1= ? and academic_year2= ? and company_type like ?",@dob,params[:sslc],params[:puc],params[:diploma],params[:cgpa],params[:gap_in_edu],params[:salary],params[:active_backlogs],@reg_date,@test_date,@int_date,params[:academic_year1],params[:academic_year2],params[:company_type])
            @companies << @temp
         
                 end
                              
           end
              @companies.each do |c|  
                 c.each do |company| #not unique company 
                   @unique_array<< company
                 end 
               end
              
           #excel thing
          
           $company3=[]
            if @unique_array
              $company3= @unique_array.uniq
            end
         else
          flash[:notice] = "Please Select a Branch"
          redirect_to(:action => 'company')
          return
               
         end
     
   end







def registration
@year1=params[:Academic_Year1]
@year2=params[:Academic_Year2]
@cmp=[]
@branch=[]
  @cmpname=[]
  @cmpname<< "ALL"
  if $select==0
  @cmp=Company.all
  elsif $select==1
  @cmp=PgCompany.all
  elsif $select==2
  @branch= PgBranch.find_by_branch_name("MCA")
    @branch.pg_companies.each do |comp|

     @cmp << comp
   end
  end
  
  @cmp.each do |cmpname|
  
    @cmpname << cmpname.cmp_name

  end


end



def result4
  @student=[]

@year1=params[:Academic_Year1]
@year2=params[:Academic_Year2]
@c=params[:c]
@c1=@c.to_i
@f5=0
 if params[:company]!="ALL"
     @f5=1
      if @c1 == 0
          @company=Company.find_by_cmp_name(params[:company])
          if @company.academic_year1 ==@year1.to_i && @company.academic_year2 ==@year2.to_i
               @company.student_registrations.each do |registration|

               if !params[:branch_id].nil?
                   params[:branch_id].each do |branch|
            
              # only placed is selected
                     if params[:Placed] && !params[:Notplaced]
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i  && registration.placed==true && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end
                        
                     elsif params[:Notplaced] && !params[:Placed]
                                             
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i  && registration.placed==false && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end
                     else
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end         
                    end
              
                 end


             else
              flash[:notice]  = "Please Enter a Branch"    
              redirect_to(:action => 'registration')
             return
           end
           end
         else 
          flash[:notice]  = "Registartion is not yet open for this company"    
          redirect_to(:action => 'registration')
         return
        end
      elsif @c1 == 1
           @company=PgCompany.find_by_cmp_name(params[:company])

               if  @company.academic_year1 ==@year1.to_i && @company.academic_year2 ==@year2.to_i
                   @company.mtech_student_registrations.each do |registration|

                      if !params[:branch_id].nil?
                          params[:branch_id].each do |branch|
             
              # only placed is selected
                        if params[:Placed] && !params[:Notplaced]
                         @temp=MtechStudent.find_by_id(registration.mtech_student_id)
                            if @temp.pg_branch_id==branch.to_i  && registration.placed==true && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end
                        
                     elsif params[:Notplaced] && !params[:Placed]
                                             
                        @temp = MtechStudent.find_by_id(registration.mtech_student_id)
                        if @temp.pg_branch_id==branch.to_i  && registration.placed==false && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end
                     else
                        @temp = MtechStudent.find_by_id(registration.mtech_student_id)
                        if @temp.pg_branch_id==branch.to_i && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end         
                    end
              
                 end


             else
              flash[:notice]  = "Please Enter a Branch"    
              redirect_to(:action => 'registration')
             return
           end
           end
         else 
          flash[:notice]  = "Registartion is not yet open for this company"    
          redirect_to(:action => 'registration')
         return
        end
       elsif $select ==2
          
            @company=PgCompany.find_by_cmp_name(params[:company])
                 if  @company.academic_year1 ==@year1.to_i && @company.academic_year2 ==@year2.to_i
                       @company.mca_students_registrations.each do |registration|
                         if params[:Placed] && !params[:Notplaced]
                           @temp=McaStudent.find_by_id(registration.mca_student_id)
                            if registration.placed==true && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                            end
                        
                         elsif params[:Notplaced] && !params[:Placed]
                                             
                           @temp = McaStudent.find_by_id(registration.mca_student_id)
                             if registration.placed==false && @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                              @student << @temp           
                           end
                       else 
                        @temp = McaStudent.find_by_id(registration.mca_student_id)
                        if  @temp.academic_year1==@year1.to_i && @temp.academic_year1==@year1.to_i
                             @student << @temp           
                        end         
                      end
                    end
          else 
          flash[:notice]  = "Registartion is not yet open for this company"    
          redirect_to(:action => 'registration')
          return
          end

      end
  
   else
     @f5=0  
    # @companies=Company.all
     #@companies.each do |company|
    if $select==0
    @students=Student.all
    elsif $select==1
    @students=MtechStudent.all
    else 
    @students=McaStudent.all
    end
      # company.student_registrations.each do |registration|
    if $select==0 || $select==1
    @students.each do |student|
       @count=0
       if !params[:branch_id].nil?

                params[:branch_id].each do |branch|
                        if $select ==0 
                        @s1=student.branch_id
                         elsif $select==1
                        @s1=student.pg_branch_id
                         end
                       if params[:Placed] && !params[:Notplaced]
                        #@temp = Student.find_by_id(registration.student_id)
                        if @s1==branch.to_i  && student.placed==true && student.academic_year1==@year1.to_i && student.academic_year1==@year1.to_i 
                             @student << student           
                        end
                        
                       elsif params[:Notplaced] && !params[:Placed]
                         #@temp = Student.find_by_id(registration.student_id)
                         if  @s1==branch.to_i  && student.placed==false && student.academic_year1==@year1.to_i && student.academic_year1==@year1.to_i 
                         @student << student
                      
                         end
                      else
                        #@temp = Student.find_by_id(registration.student_id)
                        if @s1==branch.to_i && student.academic_year1==@year1.to_i && student.academic_year1==@year1.to_i   
                             @student << student           
                        end         
                     end
     
               end
 
        else
         flash[:notice]  = "Please Enter a Branch"    
         redirect_to(:action => 'registration')
        return
       end
    end
    else
        @students.each do |student|
       @count=0
                       
        
                       if params[:Placed] && !params[:Notplaced]
                        #@temp = Student.find_by_id(registration.student_id)
                        if student.placed==true && student.academic_year1==@year1.to_i && student.academic_year1==@year1.to_i 

                             @student << student           
                        end
                        
                       elsif params[:Notplaced] && !params[:Placed]
                         #@temp = Student.find_by_id(registration.student_id)
                         if  student.placed==false && student.academic_year1==@year1.to_i && student.academic_year1==@year1.to_i 
                         @student << student
                      
                         end
                      else
                        #@temp = Student.find_by_id(registration.student_id)
                        if  student.academic_year1==@year1.to_i && student.academic_year1==@year1.to_i   
                             @student << student           
                        end         
                      end
     
         end
    
    end

  end 
    $student1=[]
    $student1=@student 

end  
 
     def unregister
          
         @c2=params[:c]
         @c1=@c2.to_i
           
            if @c1==0              
            @mca_student_registrations= StudentRegistration.find_by_student_id_and_company_id(params[:student],params[:com])
            elsif @c1==1
            @mca_student_registrations= MtechStudentRegistration.find_by_mtech_student_id_and_pg_company_id(params[:student],params[:com])
            else
            @mca_student_registrations= McaStudentsRegistration.find_by_mca_student_id_and_pg_company_id(params[:student],params[:com])
            end
           if @mca_student_registrations.destroy
          flash[:notice] = 'Sucessfully Unregistered'
          redirect_to(:action => 'registration')
          return
          else
            flash[:notice] = 'Some Error occured !! Try again!!!'
          end

    end
end  



