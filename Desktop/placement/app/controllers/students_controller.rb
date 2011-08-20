
class StudentsController < ApplicationController
  filter_resource_access
  
  

def index
   
    @students = Student.order(:branch_id).all
     
end

 
def show
  
  @student = Student.find(params[:id])

end

  
def new
    @branch=Branch.all
    @student = Student.new

end

 
def edit
    @student = Student.find(params[:id])

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
      
   if @student.destroy
      flash[:notice]="Student deleted"
      redirect_to(:action=>'index')
   end

  end
end