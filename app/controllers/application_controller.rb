class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'csv'
  protect_from_forgery with: :null_session
  
  before_action :require_login,:require_session
  private
  def require_session
    unless CoachingSession.where(:status => true).take
      flash[:notice] = "No session activated"
      redirect_to url_for(:controller => :users, :action => :coaching)
      return false
    else
      return true
    end
  end
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
