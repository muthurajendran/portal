$xs
class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  

  def admin
    
  end
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new
   
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end
  
  def edits
     @users = User.find_by_id(params[:id])
     @x=@users.username
     $xs=@users.role
     
     @user=User.new(:username=>@x)
   end
    

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save

              format.html { redirect_to(:controller=>'admin',:action=> 'index', :notice => 'User session was successfully created.') }
              format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
         
        
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def user
    @student=Student.find_by_id(params[:id])
   
    
     @user = User.create(:username  => @student.reg_no.to_s,:password  => @student.reg_no.to_s,:password_confirmation  =>  @student.reg_no.to_s, :role  => 'student')
       flash[:notice] = 'It is highly recommended that you change your password, your current password will be your USN. One week time will be given to change your Profile Information.After that you wont be allowed to edit'
             
      redirect_to(edit_user_path(:current))
  end
  
  def user_mtech
     @mtech_student=MtechStudent.find_by_id(params[:id])
      @user = User.create(:username  => @mtech_student.reg_no.to_s,:password  => @mtech_student.reg_no.to_s,:password_confirmation  =>  @mtech_student.reg_no.to_s, :role  => 'mtech_student')
      flash[:notice] = 'It is highly recommended that you change your password, your current password will be your USN. One week time will be given to change your Profile Information.After that you wont be allowed to edit'
       redirect_to(edit_user_path(:current))
  end
  
   def user_mca
     @mca_student=McaStudent.find_by_id(params[:id])
      @user = User.create(:username  => @mca_student.reg_no.to_s,:password  => @mca_student.reg_no.to_s,:password_confirmation  =>  @mca_student.reg_no.to_s, :role  => 'mca_student')
        flash[:notice] = 'It is highly recommended that you change your password, your current password will be your USN. One week time will be given to change your Profile Information.After that you wont be allowed to edit'
          redirect_to(edit_user_path(:current))
   end

  # PUT /users/1
  # PUT /users/1.xml
   # PUT /users/1.xml
    def update
      @user = current_user
      # if @user.valid_password?('4nm08cs075')
        respond_to do |format|
         if @user.update_attributes(params[:user].reject{|key, value| key == :old_password})
            @user=User.find_by_id(current_user)

            if @user.role.to_s == 'admin'
              flash[:notice]= 'Password updated successfully'
               format.html { redirect_to(:controller=>'admin',:action=> 'index') }
               format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
            elsif @user.role.to_s == 'placement'
                  flash[:notice]= 'Password updated successfully'
                  format.html { redirect_to(:controller=>'admin',:action=> 'index') }
                  format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }

            elsif @user.role.to_s == 'student'
              flash[:notice]= 'Password updated successfully'
               format.html { redirect_to(:controller=>'students_registrations',:action=> 'index') }
                format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
            elsif @user.role.to_s == 'mtech_student'
              flash[:notice]= 'Password updated successfully'
               format.html {  redirect_to(:controller=>'mtech_student_registrations',:action=> 'index')}
                format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
            else
              flash[:notice]= 'Password updated successfully'
              format.html { redirect_to(:controller=>'mca_students_registrations',:action=> 'index') }
                format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
            end
         else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
         end
       end
      #else
       #  flash[:notice] = 'Your old password is wrong.'

        # render(:action => :edit)
    #end
  end
  
  
  def update_password
      @user=User.new(params[:user])
      @user.role=$xs
      @users=User.find_by_username(@user.username)
      if @users.destroy
          if @user.save
            flash[:notice]='password changed successfully'
             redirect_to(:controller=>'users',:action=>'index')
          else
            render(:controller=>'users',:action=>'edits')
          end
      else
        flash[:notice]='unknown username'
         redirect_to(:controller=>'users',:action=>'index')
      end   
  end

  # DELETE /users/1
  # DELETE /users/1.xml
 
    def delete
        @user=User.find(params[:id])
    end
  def destroy
    @user = User.find(params[:id])
    @student=Student.find_by_reg_no(@user.username)
    @mtech_student=MtechStudent.find_by_reg_no(@user.username)
    @mca_student= McaStudent.find_by_reg_no(@user.username)
    @user.destroy
    if @student
      @student.destroy
    end  
    if @mtech_student
      @mtech_student.destroy
    end
    if @mca_student
      @mca_student.destroy
    end
    
    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end