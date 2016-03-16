class UsersController < ApplicationController
  # layout false
  skip_before_action :require_login, :only => [:attempt_login, :login]
  def index
      
  end

  def login
    if session[:id]!=nil
      redirect_to(:action => 'index')
    end
    
  end
  
  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      flash[:notice] = "You are now logged in"
      session[:id] = authorized_user.id
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid username/Password combination."
      redirect_to(:action => 'login')
    end
  end
  def logout
    flash[:notice]="Logged out"
    session[:id] = nil
    redirect_to(:action => "login")
  end

end
