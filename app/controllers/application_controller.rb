class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'csv'
  protect_from_forgery with: :null_session
  
  before_action :require_login
  private
 
  def require_login
      unless session[:id] or config.my_config
          flash[:notice] = "You are not Logged In"
          redirect_to :root
          return false
      else
        return true
      end
 
  end
  
end
