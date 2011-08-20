class GuestsController < ApplicationController
    filter_resource_access
    def index
    @guests =  Guest.all
  end
  
  def new
    @guest = Guest.new
    @event_name=[]
    @event= Event.all
    if !@event.nil?
    @event_name<<"ALL"  
    @event.each do |eventname|
      @event_name << eventname.event_name
    end
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end
  
  def show
    @guest=Guest.find(params[:id])
  end

  def create
    @guest=Guest.new(params[:guest])
    if @guest.save
      flash[:notice]="Guest created"
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end
  
   def update
      @guest= Guest.find(params[:id])
      if @guest.update_attributes(params[:guest])
        flash[:notice]="Guest updated"
        redirect_to(:action=>'show',:id =>@guest.id)
      else
        render('edit')  
      end
    end
    
     def delete
        @guest=Guest.find(params[:id])
      end
      def destroy
         Guest.find(params[:id]).destroy
         flash[:notice]="Guest deleted"
         redirect_to(:action=>'index')
      end
end
