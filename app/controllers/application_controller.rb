class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  # before_action :require_login
  private
 
  def require_login
      unless session[:id]
          flash[:notice] = "You are not Logged In"
          redirect_to :root
          return false
      else
        return true
      end
     # if :key==nil
      #  redirect_to :root
      #end
        
  end
  
#  def handle_unverified_request
 #   super # call the default behaviour, including Devise override
  #  authenticate_user!
  #end
  
end
