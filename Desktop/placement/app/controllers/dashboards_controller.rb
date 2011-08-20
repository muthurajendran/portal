class DashboardsController < ApplicationController
 
   filter_resource_access
    def index
      @dashboards =  Dashboard.all
    end

    def new
      @dashboard = Dashboard.new
    end

    def edit
      @dashboard = Dashboard.find(params[:id])
    end

    def show
      @dashboard=Dashboard.find(params[:id])
    end

    def create
      @dashboard=Dashboard.new(params[:dashboard])
      if @dashboard.save
        flash[:notice]="Dashboard created"
        redirect_to(:action =>'index')
      else
        render('new')
      end
    end

     def update
        @dashboard= Dashboard.find(params[:id])
        if @dashboard.update_attributes(params[:dashboard])
          flash[:notice]="Dashboard updated"
          redirect_to(:action=>'show',:id =>@dashboard.id)
        else
          render('edit')  
        end
      end

       def delete
          @dashboard=Dashboard.find(params[:id])
        end
        def destroy
           Dashboard.find(params[:id]).destroy
           flash[:notice]="Dashboard deleted"
           redirect_to(:action=>'index')
        end

  end
