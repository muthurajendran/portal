class MtechStudentsController < ApplicationController
filter_resource_access
  def index

      @mtech_students = MtechStudent.all
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
    @mtech_student = MtechStudent.find(params[:id])

  end


  def new
    @setting= Setting.find_by_fields("registration")
     if @setting.blank?
       @value=true
     else
       @value=@setting.value
     end
      @pg_branch=PgBranch.all
      @mtech_student = MtechStudent.new

  end


  def edit
      @mtech_student = MtechStudent.find(params[:id])

  end


def create
       @default=0
      @mtech_student = MtechStudent.new(params[:mtech_student])
      if @mtech_student.diploma.blank?
            @mtech_student.diploma = @default
      end    
      if @mtech_student.puc.blank?
            @mtech_student.puc = @default
      end    
      if @mtech_student.mtech_be_cgpa.blank?
            @mtech_student.mtech_be_cgpa = @default
      end    
      if @mtech_student.mtech_be_per.blank?
            @mtech_student.mtech_be_per = @default
      end
      if @mtech_student.sgpa_sem3.blank?
             @mtech_student.sgpa_sem3 = @default
      end
      if @mtech_student.sgpa_sem4.blank?
             @mtech_student.sgpa_sem4 = @default
      end
     
@mtech_student.question_set=true
      if @mtech_student.save
        flash[:notice]="Student created"

        redirect_to(:controller=>'users', :action  => 'user_mtech', :id=> @mtech_student.id)
        else
        render('new') 
      end
end


    def update
      @default=0
      params[:mtech_student][:pg_branch_id] ||= []
      @mtech_student = MtechStudent.find(params[:id])
      if @mtech_student.update_attributes(params[:mtech_student])
          if @mtech_student.diploma.blank?
              @mtech_student.update_attributes(:diploma  => @default)
          end
          if @mtech_student.puc.blank?
              @mtech_student.update_attributes(:puc  => @default)
          end
          if @mtech_student.mtech_be_cgpa.blank?
            @mtech_student.update_attributes(:mtech_be_cgpa => @default )
          end    
           if @mtech_student.mtech_be_per.blank?
            @mtech_student.update_attributes(:mtech_be_per => @default)
           end
           if @mtech_student.sgpa_sem3.blank?
             @mtech_student.update_attributes(:sgpa_sem3 => @default)
           end
           if @mtech_student.sgpa_sem4.blank?
             @mtech_student.update_attributes(:sgpa_sem4 => @default)
           end
           @mtech_student.update_attributes(:question_set=>true)
             flash[:notice]="Student updated"
             redirect_to(:action=>'show',:id =>@mtech_student.id)
        else
           render('edit')  
    end
    end

     def delete
        @mtech_student=MtechStudent.find(params[:id])
     end

    def destroy
     @mtech_student= MtechStudent.find(params[:id])

     if @mtech_student.destroy
        flash[:notice]="Student deleted"
        redirect_to(:action=>'index')
     end

    end
end
