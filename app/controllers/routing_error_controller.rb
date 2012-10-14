class RoutingErrorController < ApplicationController
  def catcher 
    flash[:notice] = "Sorry 404 Error"
    redirect_to(:controller=>'home',:action=>'index')
end
end