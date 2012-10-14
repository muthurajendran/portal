class SettingsController < ApplicationController
  
  def index
    @setting= Setting.find_by_fields("registration")
    if @setting.blank?
      @setting= Setting.create(:fields=>"registration",:value=>true)
    end
  end
  
  def edit
    @setting = Setting.find(params[:id])
  end
  
  def update
      @setting= Setting.find(params[:id])
      if @setting.update_attributes(params[:setting])
        flash[:notice]="Setting updated"
        redirect_to(:action=>'index')
      else
        render('edit')  
      end
  end
  
end
