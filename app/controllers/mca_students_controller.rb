class McaStudentsController < ApplicationController

filter_resource_access
  def index

      @mca_students = McaStudent.all
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
    @mca_student = McaStudent.find(params[:id])

  end


  def new
    @setting= Setting.find_by_fields("registration")
     if @setting.blank?
       @value=true
     else
       @value=@setting.value
     end
     @pg_branch=PgBranch.find_by_branch_name('MCA')
      @mca_student = McaStudent.new

  end


  def edit
      @mca_student = McaStudent.find(params[:id])

  end


def create
       @default=0
      @mca_student = McaStudent.new(params[:mca_student])
  if @mca_student.diploma.blank?
        @mca_student.diploma = @default
  end    
  if @mca_student.puc.blank?
        @mca_student.puc = @default
  end    
    
  #if @mca_student.degree.blank?
  #      @mca_student.degree = @default
  #end
  
  if @mca_student.sgpa_sem5.blank?
        @mca_student.sgpa_sem5 = @default
  end
  
  if @mca_student.sgpa_sem6.blank?
        @mca_student.sgpa_sem6 = @default
  end
@mca_student.question_set=true
      if @mca_student.save
        flash[:notice]="Student created"

        redirect_to(:controller=>'users', :action  => 'user_mca', :id=> @mca_student.id)
        else
        render('new') 
      end
end


    def update
      @default=0
      params[:mca_student][:pg_branch_id] ||= []
      @mca_student = McaStudent.find(params[:id])
      if @mca_student.update_attributes(params[:mca_student])
          
          if @mca_student.diploma.blank?
              @mca_student.update_attributes(:diploma  => @default)
          end
          
          if @mca_student.puc.blank?
              @mca_student.update_attributes(:puc  => @default)
          end
          
          #if @mca_student.degree.blank?
          #    @mca_student.degree = @default
          #end
          
          if @mca_student.sgpa_sem5.blank?
              @mca_student.update_attributes(:sgpa_sem5 => @default)
          end
           
          if @mca_student.sgpa_sem6.blank?
              @mca_student.update_attributes(:sgpa_sem6 => @default)
          end
          @mca_student.update_attributes(:question_set =>true) 
          flash[:notice]="Student updated"
          redirect_to(:action=>'show',:id =>@mca_student.id)
        else
           render('edit')  
       end
   end

     def delete
        @mca_student=McaStudent.find(params[:id])
     end

    def destroy
     @mca_student= McaStudent.find(params[:id])

     if @mca_student.destroy
        flash[:notice]="Student deleted"
        redirect_to(:action=>'index')
     end

    end
end
