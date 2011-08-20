class UserSessionsController < ApplicationController
  # GET /user_sessions
  # GET /user_sessions.xml
  
  filter_resource_access
  def index
    @user_sessions = UserSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_sessions }
    end
  end

  # GET /user_sessions/1
  # GET /user_sessions/1.xml
  def show
    @user_session = UserSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_session }
    end
  end

  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    if current_user
      redirect_to(:action=>'logged_in')
    else
    @user_session = UserSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
    end

  end
  
  def logged_in
     @user=User.find_by_username(current_user)

       if @user.role.to_s == 'admin'
          format.html { redirect_to(:controller=>'admin',:action=> 'index', :notice => 'User session was successfully created.') }
          format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
       elsif @user.role.to_s == 'student'
          format.html { redirect_to(:controller=>'students_registrations',:action=> 'index', :notice => 'User session was successfully created.') }
          format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
        elsif @user.role.to_s == 'mtech_student'
              format.html { redirect_to(:controller=>'mtech_student_registrations',:action=> 'index', :notice => 'User session was successfully created.') }
              format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
        elsif @user.role.to_s == 'mca_student'
              format.html { redirect_to(:controller=>'mca_students_registrations',:action=> 'index', :notice => 'User session was successfully created.') }
              format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
       else
          format.html { redirect_to(:controller=>'admin',:action=> 'index', :notice => 'User session was successfully created.') }
           format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
       end
  
  end
  

  # GET /user_sessions/1/edit
  def edit
    @user_session = UserSession.find(params[:id])
  end
  


  # POST /user_sessions
  # POST /user_sessions.xml
  def create
     @user_session = UserSession.new(params[:user_session])

     respond_to do |format|
       if @user_session.save
          @user=User.find_by_username(params[:user_session][:username])

           if @user.role.to_s == 'admin'
              format.html { redirect_to(:controller=>'admin',:action=> 'index', :notice => 'User session was successfully created.') }
              format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
           elsif @user.role.to_s == 'student'
              format.html { redirect_to(:controller=>'students_registrations',:action=> 'index', :notice => 'User session was successfully created.') }
              format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
            elsif @user.role.to_s == 'mtech_student'
                  format.html { redirect_to(:controller=>'mtech_student_registrations',:action=> 'index', :notice => 'User session was successfully created.') }
                  format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
            elsif @user.role.to_s == 'mca_student'
                  format.html { redirect_to(:controller=>'mca_students_registrations',:action=> 'index', :notice => 'User session was successfully created.') }
                  format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
           else
              format.html { redirect_to(:controller=>'admin',:action=> 'index', :notice => 'User session was successfully created.') }
               format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
           end 
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
       end
     end
   end

  # PUT /user_sessions/1
  # PUT /user_sessions/1.xml
  def update
    @user_session = UserSession.find(params[:id])

    respond_to do |format|
      if @user_session.update_attributes(params[:user_session])
        format.html { redirect_to(:controller=>'users', :action=>'edit') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find 
    @user_session.destroy

    respond_to do |format|
      format.html { redirect_to(:controller=>'home', :action=> 'index') }
      format.xml  { head :ok }
    end
  end
  def roles
     @user=User.find_by_username(params[:user_session][:username])
      
      if @user.role.to_s ='student' 
         redirect_to(:controller=>'user_sessions',:action=> 'edit', :notice => 'User session was successfully created.')
      else
         redirect_to(:controller=>'companies',:action=> 'new', :notice => 'User session was successfully created.')  
      end
  end
end