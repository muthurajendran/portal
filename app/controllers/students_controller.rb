
class StudentsController < ApplicationController
  filter_resource_access
  
  

def index
   
    @students = Student.order(:branch_id).all

    @y1= params[:year_select1]
     @y2= params[:year_select2]
    @year1=@y1.to_i
   @year2=@y2.to_i

     
end

 
def show
  @setting= Setting.find_by_fields("registration")
   if @setting.blank?
     @value=true
   else
     @value=@setting.value
   end
  @student = Student.find(params[:id])

end

  
def new
    @setting= Setting.find_by_fields("registration")
     if @setting.blank?
       @value=true
     else
       @value=@setting.value
     end
    @branch=Branch.all
    @student = Student.new

end

 
def edit
  @e=params[:c]

  if @e.to_i==0
    @student = Student.find(params[:id])
  elsif @e.to_i==1 
    @student=MtechStudent.find(params[:id])
    {:controller=>'mtech_students',:action=> 'edit',:id=> @student.id}
  else 
        @student=McaStudent.find(params[:id])
  {:controller=>'mca_students',:action=> 'edit',:id=> @student.id}
end
end

 
  def create
     @default=0
    @student = Student.new(params[:student])
    if @student.diploma.blank?
      @student.diploma = @default
    end    
    
     if @student.puc.blank?
      @student.puc = @default
    end 
     
    if @student.sgpa_sem1.blank?
      @student.sgpa_sem1 = @default
    end  
    
    if @student.sgpa_sem2.blank?
      @student.sgpa_sem2 = @default
    end   
    
    if @student.sgpa_sem7.blank?
      @student.sgpa_sem7 = @default
    end 
    
    if @student.sgpa_sem8.blank?
      @student.sgpa_sem8 = @default
    end 
    @student.question_set=true
 
    if @student.save
      flash[:notice]="Student created"
    
      redirect_to(:controller  => 'users' , :action  => 'user',:id => @student.id)
      else
      render('new') 
    end
  end

 
  def update
    @default=0
    params[:student][:branch_id] ||= []
    @student = Student.find(params[:id])
      if @student.update_attributes(params[:student])
        if @student.diploma.blank?
            @student.update_attributes(:diploma  => @default)
        end
        if @student.puc.blank?
            @student.update_attributes(:puc  => @default)
        end
        
        if @student.sgpa_sem1.blank?
          @student.update_attributes(:sgpa_sem1 => @default)
        end  
        
        if @student.sgpa_sem2.blank?
          @student.update_attributes(:sgpa_sem2 => @default)
        end   
        
        if @student.sgpa_sem7.blank?
          @student.update_attributes(:sgpa_sem7 => @default)
        end 
        
        if @student.sgpa_sem8.blank?
          @student.update_attributes(:sgpa_sem8 => @default)
        end 
   
          @student.update_attributes(:question_set =>true)
   


           flash[:notice]="Student updated"
           redirect_to(:action=>'show',:id =>@student.id)
      else
         render('edit')  
    end
  end

   def delete
      @student=Student.find(params[:id])
   end
  
  def destroy
   @student= Student.find(params[:id])
   
   User.all.each do |user|
     if user.username == Student.find(@student.id).reg_no
        User.find(user.id).destroy
     end
   end
   
   StudentRegistration.all.each do |reg|
     if reg.student_id == @student.id
       StudentRegistration.find_by_student_id(@student.id).destroy
     end
   end   
   
   if @student.destroy
      flash[:notice]="Student deleted"
      redirect_to(:action=>'index')
   end

  end
end
