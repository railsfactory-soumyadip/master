class SessionsController < ApplicationController
  before_action :authenticate_user!
  
  def new 
    flash[:notice] = "User logged in successfully"
    redirect_to :controller => "students", :action => "index", :id => current_user.id
  end

end
