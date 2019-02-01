class SessionsController < ApplicationController
  
  def new 
  end

  def create
  	user = Teacher.find_by(email: params[:session][:email].downcase)
  	if user && user.password == params[:session][:password]
      redirect_to :controller => "students", :action => "index", :id => user.id
    else	
    	# flash[:error] = "Invalid Email or Password"
      render 'new'
    end
  end

  def destroy
  	
  end
end
