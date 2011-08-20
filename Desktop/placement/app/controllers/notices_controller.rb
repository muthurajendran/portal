class NoticesController < ApplicationController

     filter_resource_access
      def index
        @notices =  Notice.all
      end

      def new
       @notice = Notice.new
      end

      def edit
        @notice = Notice.find(params[:id])
      end

      def show
        @notice=Notice.find(params[:id])
      end

      def create
        @notice=Notice.new(params[:notice])
        if  @notice.save
          flash[:notice]="Notice created"
          redirect_to(:action =>'index')
        else
          render('new')
        end
      end

       def update
          @notice= Notice.find(params[:id])
          if  @notice.update_attributes(params[:notice])
            flash[:notice]="Notice updated"
            redirect_to(:action=>'show',:id => @notice.id)
          else
            render('edit')  
          end
        end

         def delete
            @notice=Notice.find(params[:id])
          end
          def destroy
            Notice.find(params[:id]).destroy
             flash[:notice]="Notice deleted"
             redirect_to(:action=>'index')
          end

    end

