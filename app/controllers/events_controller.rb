class EventsController < ApplicationController
 
 filter_resource_access
 def index
    @events =  Event.all
  end
  
  def new
    @event = Event.new
  end

  def edit
   
    @event = Event.find(params[:id])
  end
  
  def show
    @x=params[:id]
  end

  def create
    @event=Event.new(params[:event])
    if @event.save
      flash[:notice]="Event created"
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end
  
   def update
      @event= Event.find(params[:id])
      if @event.update_attributes(params[:event])
        flash[:notice]="Event updated"
        redirect_to(:action=>'show',:id =>@event.id)
      else
        render('edit')  
      end
    end
    
     def delete
        @event=Event.find(params[:id])
      end
      def destroy
         Event.find(params[:id]).destroy
         flash[:notice]="Event deleted"
         redirect_to(:action=>'index')
      end

    
    
end
