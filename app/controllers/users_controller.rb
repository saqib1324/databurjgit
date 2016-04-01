class UsersController < ApplicationController
  # layout false
  skip_before_action :require_login, :only => [:attempt_login, :login]

  def index
    if params[:admin]=="dashboard"
      @link="a"
    end
    if params[:admin]=="students_view"
      @link= "students_view"
      @students= Student.all
      
    elsif params[:admin]=="sections_view"
      @sections=Section.all
      @link = "sections_view"
    elsif params[:admin]=="instructors_view"
      @instructors=Instructor.all
      @link = "instructors_view"
      
      
    elsif params[:admin] == "student_add"
      @link = "student_add"
    elsif params[:admin] == "instructor_add"
      @link = "instructor_add"
    elsif params[:admin]=="section_add"
       @link = "section_add"
 
 
    elsif params[:admin] == "student_edit"
      @link = "student_edit"
      @student= Student.find(params[:id])
    elsif params[:admin] == "instructor_edit"
      @link = "instructor_edit"
      @instructor = Instructor.find(params[:id])

    end
    
  
  end
  
  
  def student_index
      # @found3 = params[:found2]

    if params[:std]=="student_profile"
      @link = "student_profile"
      @student=Student.find(session[:id])
      # @found3 = params[:found2]
      # @found3=Student.find(params[:found2])
      
    end
  end

  def login
    if session[:id]!=nil
      redirect_to(:action => 'index')
      
    end
    
  end
  
  # def attempt_login
  #   if params[:username].present? && params[:password].present?
  #     found_user = User.where(:username => params[:username]).first
  #     if found_user
  #       authorized_user = found_user.authenticate(params[:password])
  #     end
  #   end
  #   if authorized_user
  #     flash[:notice] = "You are now logged in"
  #     session[:id] = authorized_user.id
  #     redirect_to(:action => 'index')
  #   else
  #     flash[:notice] = "Invalid username/Password combination."
  #     redirect_to(:action => 'login')
  #   end
  # end
  
  
    def attempt_login
      if params[:username].present? && params[:password].present?
          found_user = User.where(:username => params[:username]).first
          if found_user
            authorized_user = found_user.authenticate(params[:password])
            if authorized_user
              flash[:notice] = "Welcome! You are LoggedIn"
              session[:id] = authorized_user.id
              $restrict = 'admin'
              redirect_to(:action => 'index')
              return
            end
          end
          found_student = Student.where(:username => params[:username]).first
            if found_student
              student_id = Student.authenticate( params[:username],params[:password])
              if student_id
                flash[:notice] = "Welcome! You are LoggedIn"
                session[:id] = student_id
                $restrict = 'student'
                redirect_to(:action => 'student_index')
                return
              end
            end
          found_instructor = Instructor.where(:username => params[:username]).first
            if found_instructor
              instructor_id = Instructor.authenticate( params[:username],params[:password])
              if instructor_id
                flash[:notice] = "Welcome! You are LoggedIn"
                session[:id] = instructor_id
                $restrict = 'instructor'
                redirect_to(:action => 'instructor_index')
                return
              end 
            end
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
