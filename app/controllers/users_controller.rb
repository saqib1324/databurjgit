class UsersController < ApplicationController
  # layout false
  
  skip_before_action :require_login, :only => [:attempt_login, :login]
  # load_and_authorize_resource
  
  
  # before_action :restrict_entry, :except => [:student_index, :instructor_index]
  # before_action :restrict_entry2, :except => [:instructor_index]
  
  # before_action :for_student, :only => [:student_index, :attempt_login, :login, :logout ]
  # before_action :for_instructor, :only => [:instructor_index, :attempt_login, :login, :logout ]
 
  def index
    if params[:admin]=="dashboard"
      @link="a"
    end
    if params[:admin]=="students_view"
      @link= "students_view"
      @students= Student.order(params[:sort])
      
    elsif params[:admin]=="sections_view"
      @sections=Section.order(params[:sort])
      @link = "sections_view"
    elsif params[:admin]=="instructors_view"
      @instructors=Instructor.order(params[:sort])
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
    elsif params[:admin] == "section_edit"
      @link = "section_edit"
      @section = Section.find(params[:id])
    elsif params[:admin] == "student_view"
      @link = "student_view"
      @student=Student.find(params[:id])
    end
    
  
  end
  
  
  def student_index
      # @found3 = params[:found2]

    if params[:std]=="student_profile"
      @link = "student_profile"
      @student=Student.find(session[:id])
      # unauthorized! if cannot? :read, @instructor
      # @found3 = params[:found2]
      # @found3=Student.find(params[:found2])
      
    end
  end
  def instructor_index
    if params[:ins]=="instructor_profile"
      @link = "instructor_profile"
      @instructor=Instructor.find(session[:id])
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
              $user_role = 'admin'
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
                $user_role = 'student'
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
                $user_role = 'instructor'
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
  
  
    def restrict_entry
      if $restrict == 'admin'
        return true
      else
        flash[:notice] = "You are not authorized to view this page"
        if $restrict== 'student'
          redirect_to :action => 'student_index'
          return false
        else
          redirect_to :action => 'instructor_index'
          return false
        end
      end 
    end
    
    
    def for_student
      if $restrict == 'student'
        return true
      else
        flash[:notice] = "You are not authorized to view this page"
        # redirect_to :root
        if $restrict== 'instructor'
            redirect_to :action => 'instructor_index'
            return false
        else
            redirect_to :action => 'index'
            return false
        end
      end
    end

    def for_instructor
      if $restrict == 'instructor'
        return true
      else
        flash[:notice] = "You are not authorized to view this page"
        if $restrict== 'student'
          redirect_to :action => 'student_index'
          return false
        else
          redirect_to :action => 'index'
          return false
        end
      end
    end
end
