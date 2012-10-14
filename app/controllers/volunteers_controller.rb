class VolunteersController < ApplicationController
  filter_resource_access
   def index
    @volunteers =  Volunteer.all
  end
  
  def new
    @volunteer = Volunteer.new
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end
  
  def show
    @volunteer=Volunteer.find(params[:id])
  end

  def create
    @volunteer=Volunteer.new(params[:volunteer])
    if @volunteer.save
      flash[:notice]="Volunteer created"
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end
  
   def update
      @volunteer= Volunteer.find(params[:id])
      if @volunteer.update_attributes(params[:volunteer])
        flash[:notice]="Volunteer updated"
        redirect_to(:action=>'show',:id =>@volunteer.id)
      else
        render('edit')  
      end
    end
    
     def delete
        @volunteer=Volunteer.find(params[:id])
      end
      def destroy
         Volunteer.find(params[:id]).destroy
         flash[:notice]="Volunteer deleted"
         redirect_to(:action=>'index')
      end
end
