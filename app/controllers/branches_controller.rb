class BranchesController < ApplicationController
 
  filter_resource_access
  def index
    @branches =  Branch.all
  end
  
  def new
    @branch = Branch.new
  end

  def edit
    @branch = Branch.find(params[:id])
  end
  
  def show
    @branch=Branch.find(params[:id])
  end

  def create
    @branch = Branch.new(params[:branch])
    if @branch.save
      flash[:notice]="Branch created"
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end
  
   def update
      @branch= Branch.find(params[:id])
      if @branch.update_attributes(params[:branch])
        flash[:notice]="Branch updated"
        redirect_to(:action=>'show',:id =>@branch.id)
      else
        render('edit')  
      end
    end
    
   def delete
        @branch=Branch.find(params[:id])
   end
   
  def destroy
    
           @branch_test = Branch.find(params[:id])
           # before destroying a branch the following code destroy's all its student and the user from their respective tables
           Student.all.each do |stud|
             if stud.branch_id == @branch_test.id
               User.all.each do |user|
                 if user.username == Student.find(stud.id).reg_no
                   User.find(user.id).destroy
                 end
               end
               StudentRegistration.all.each do |reg|
                    if reg.student_id == stud.id
                        StudentRegistration.find_by_student_id(stud.id).destroy
                    end
               end 
               Student.find(stud.id).destroy
             end
           end
    
    
    
     if Branch.find(params[:id]).destroy
          flash[:notice]="Branch deleted"
          redirect_to(:action=>'index')
     end
  end

end
