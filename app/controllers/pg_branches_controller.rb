class PgBranchesController < ApplicationController

   filter_resource_access
    def index
      @pgbranches =  PgBranch.all
    end

    def new
      @pgbranch = PgBranch.new
    end

    def edit
      @pgbranch = PgBranch.find(params[:id])
    end

    def show
      @pgbranch=PgBranch.find(params[:id])
    end

    def create
      @pgbranch=PgBranch.new(params[:pgbranch])
      if @pgbranch.save
        flash[:notice]="Branch created"
        redirect_to(:action =>'index')
      else
        render('new')
      end
    end

     def update
        @pgbranch= PgBranch.find(params[:id])
        if @pgbranch.update_attributes(params[:pgbranch])
          flash[:notice]="Branch updated"
          redirect_to(:action=>'show',:id =>@pgbranch.id)
        else
          render('edit')  
        end
      end

       def delete
          @pgbranch=PgBranch.find(params[:id])
        end
        
       def destroy
           @pgbranch_test = PgBranch.find(params[:id])
           # before destroying a branch the following code destroy's all its Mtech student and the user from their respective tables
           MtechStudent.all.each do |stud|
             if stud.pg_branch_id == @pgbranch_test.id
               User.all.each do |user|
                 if user.username == MtechStudent.find(stud.id).reg_no
                   User.find(user.id).destroy
                 end
               end
               MtechStudent.find(stud.id).destroy
             end
           end
          # before destroying a branch the following code destroy's all its Mca student and the user from their respective tables           
           McaStudent.all.each do |stud|
             if stud.pg_branch_id == @pgbranch_test.id
               User.all.each do |user|
                 if user.username == McaStudent.find(stud.id).reg_no
                   User.find(user.id).destroy
                 end
               end
               McaStudent.find(stud.id).destroy
             end
           end
           
           PgBranch.find(params[:id]).destroy
           
           flash[:notice]="Branch deleted"
           redirect_to(:action=>'index')
        end
 
  end
