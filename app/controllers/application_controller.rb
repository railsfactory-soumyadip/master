class ApplicationController < ActionController::Base
	def current_teacher
		binding.pry
    return unless session[:user_id]
    @current_user ||= Teacher.find(session[:user_id])
  end
end
