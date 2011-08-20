$student1
$company3
class PlacementSearchesController < ApplicationController
 
  # filter_resource_access
  def index
    
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  
  def show_company
    @company = Company.find(params[:id])
  end
  
  
  
   def query
   
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
    if params[:branch_id].nil?
        if   params[:name] == "" && params[:reg_no] == "" 
             flash[:notice] = "Enter/Select Something"
             redirect_to(:action => 'usn')
        elsif params[:name] ==""
             @students = Student.where("reg_no = ?",params[:reg_no].squish)
             
        elsif (params[:reg_no]=="")
             @students = Student.where("name like ?","%#{params[:name].squish}%")
        elsif !(params[:name] =="" && params[:reg_no] == "")
             @students = Student.where("name like ? and reg_no = ?","%#{params[:name].squish}%",params[:reg_no].squish) 
        end
     $student1=[]
        $student1=@students   
     else  
         @flag=1
         @st = []
         params[:branch_id].each do |s|
            @branch_array << Student.where("branch_id = ?", s)
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
                  $student1<<excel
                end
              end
            end 
     end     
    end
  end
  
 def result2
     @default=0
      
     @students =[]
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
     
     if params[:gap_in_edu].blank?
       params[:gap_in_edu]=Student.maximum('gap_in_edu')
     end
     
     if params[:dob].blank?
        params[:dob]=Student.minimum('dob')
     end
     if params[:active_backlog].blank?
       
        params[:active_backlog]=Student.maximum('active_backlog')
     end
     
     if params[:total_backlogs].blank?
       
        params[:total_backlogs]=Student.maximum('total_backlogs')
     end
     
     if !params[:branch_id].nil?
           params[:branch_id].each do |b|
             if params[:gender]=='ALL'
              @student_branch = Student.where("branch_id = ?",b)
               @temp = @student_branch.where("dob >= ? and sslc >= ? and puc >= ? and diploma >= ? and gap_in_edu <= ? and cgpa >=? and active_backlog <= ? and total_backlogs <=?",params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])                  
                    unless @temp.empty?
                      @students << @temp
                    end
                else
                  @student_branch = Student.where("branch_id = ?",b)
                   @temp = @student_branch.where("gender=? and dob >= ? and sslc >= ? and puc >= ? and diploma >= ? and gap_in_edu <= ? and cgpa >=? and active_backlog <= ? and total_backlogs <=?",params[:gender],params['date']['year'],params[:sslc],params[:puc],params[:diploma],params[:gap],params[:cgpa],params[:active_backlogs],params[:total_backlogs])                  
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
                  $student1<<excel
                end
              end
            end 
       else
            flash[:notice] ="Please Select a Branch"   
            redirect_to(:action => 'other')
            return
      end     
  end
  
  def result3
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
     if params[:salary].blank?
        params[:salary]=@default
     end
     if params[:gap_in_edu].blank?
        params[:gap_in_edu]=Company.maximum('gap_in_edu')
     end
     if params[:active_backlogs].blank?
        params[:active_backlogs]=Company.maximum('backlogs')
     end
     
     if params[:dob].blank?
        params[:dob]=Company.minimum('dob')
     end
     
     if params[:reg_date].blank?
        params[:reg_date]=Company.minimum('reg_date')
     end
     
     if params[:preplacement_talk].blank?
       params[:preplacement_talk] = Company.minimum('preplacement_talk')
     end
     
     if params[:test_date].blank?
       params[:test_date] = Company.minimum('test_date')
     end
     
     if params[:interview_date].blank?
        params[:interview_date]=Company.minimum('interview_date')
     end
     
     @dob=params[:dob][:year]+"-"+ params[:dob][:month]+"-"+params[:dob][:day]
     @reg_date=params[:reg_date][:year]+"-"+ params[:reg_date][:month]+"-"+params[:reg_date][:day]
     @int_date=params[:int_date][:year]+"-"+ params[:int_date][:month]+"-"+params[:int_date][:day]
     @test_date=params[:test_date][:year]+"-"+ params[:test_date][:month]+"-"+params[:test_date][:day]
      
      
      if params[:branch_id]
          params[:branch_id].each do |s|
            @branch=Branch.find_by_id(s)
            @company_branch = @branch.companies
            if params[:company_type]=="ALL"
            @temp=@company_branch.where("dob >= ?and sslc>=? and puc>= ? and diploma>= ? and cgpa>= ? and 
            gap_in_edu<= ? and salary >= ? and backlogs <= ? and reg_date >= ? and test_date>= ? and interview_date >= ?", @dob,
            params[:sslc],params[:puc],params[:diploma],params[:cgpa],params[:gap_in_edu],params[:salary],params[:active_backlogs],@reg_date,@test_date,@int_date)
            @companies << @temp
            else
              @temp=@company_branch.where("dob >= ? and sslc>=? and puc>= ? and diploma>= ? and cgpa>= ? and 
            gap_in_edu<= ? and salary >= ? and backlogs <= ? and reg_date >= ? and test_date>= ? and interview_date >= ? and company_type like ?",@dob,
            params[:sslc],params[:puc],params[:diploma],params[:cgpa],params[:gap_in_edu],params[:salary],params[:active_backlogs],@reg_date,@test_date,@int_date,params[:company_type])
            @companies << @temp
            end
                              
         end
              @companies.each do |c|  
                 c.each do |company| #not unique company 
                   @unique_array<<company
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
  @cmpname=[]
  @cmpname<<"ALL"
  @cmp=Company.all
  @cmp.each do |cmpname|
    @cmpname << cmpname.cmp_name
  end
end


def result4

  @student=[]
  
  if params[:company]!="ALL"
  @company=Company.find_by_cmp_name(params[:company])
     @company.student_registrations.each do |registration|
       if !params[:branch_id].nil?
          params[:branch_id].each do |branch|
               if params[:Placed] && !params[:Notplaced]
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i  && registration.placed==true
                             @student << @temp           
                        end
                        
                     elsif params[:Notplaced] && !params[:Placed]
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i  && registration.placed==false 
                             @student << @temp           
                        end
                     else
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i 
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
     @companies=Company.all
     @companies.each do |company|
       company.student_registrations.each do |registration|
       if !params[:branch_id].nil?
          params[:branch_id].each do |branch|
                             if params[:Placed] && !params[:Notplaced]
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i  && registration.placed==true 
                             @student << @temp           
                        end
                        
                     elsif params[:Notplaced] && !params[:Placed]
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i  && registration.placed==false
                             @student << @temp           
                        end
                     else
                        @temp = Student.find_by_id(registration.student_id)
                        if @temp.branch_id==branch.to_i 
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
   end
   end 
    $student1=[]
    $student1=@student 
end    
end