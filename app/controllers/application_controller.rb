class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  private
 
  def require_login
      unless session[:id]
          flash[:notice] = "Please log in"
          redirect_to :root
          return false
      else
          return true
      end
  end
end
