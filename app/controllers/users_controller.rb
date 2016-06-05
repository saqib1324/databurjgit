class UsersController < ApplicationController

  skip_before_action :require_login, :only => [:attempt_login, :login]
  skip_before_action :require_session, :only => [:attempt_login, :login,:coaching,:logout]
  before_action :restrict_entry, :only => [:index]
  before_action :for_student, :only => [:student_index]
  before_action :for_instructor, :only => [:instructor_index]

  def index
    @session_id = session[:id]
    if params[:admin]=="dashboard"
      @link="a"
    ##STUDENTS
    elsif params[:admin]=="students_view"
      @link= "students_view"
      @students= Student.order(params[:sort])
      @active_session = CoachingSession.where(:status => true).take
      @students = @students.where(:session => @active_session.name)
    elsif params[:admin] == "student_add"
      @link = "student_add"
    elsif params[:admin] == "student_edit"
      @link = "student_edit"
      @student= Student.find(params[:id])
    elsif params[:admin] == "student_view"
      @link = "student_view"
      @student=Student.find(params[:id])
      # @students = Student.find(params[:id])
    elsif params[:admin] == "students_import"
      @link = "students_import"
    ##INSTRUCTORS
    elsif params[:admin] == "instructors_notice"
      @instructors=Instructor.order(params[:sort])
      @link = "instructors_view"
      flash[:notice] = "Nothing more to show"
    elsif params[:admin]=="instructors_view"
      @instructors=Instructor.order(params[:sort]).where(:session => (CoachingSession.where(:status => true).take.name))
      @link = "instructors_view"
    elsif params[:admin] == "instructor_add"
      @link = "instructor_add"
    elsif params[:admin] == "instructor_edit"
      @link = "instructor_edit"
      @instructor = Instructor.find(params[:id])
    elsif params[:admin] == "instructors_import"
      @link = "instructors_import"
    ##SECTIONS
    elsif params[:admin] == "section_view"
      @association = Association.new
      @link = "section_view"
      @section = Section.find(params[:id])
      @students = Student.where(:section => @section.section_name, :session => CoachingSession.where(:status => true).take.name)
    elsif params[:admin]=="sections_view"
      @sections=Section.order(params[:sort]).where(:session => (CoachingSession.where(:status => true).take.name))
      @link = "sections_view"
    elsif params[:admin]=="section_add"
       @link = "section_add"
    elsif params[:admin] == "section_edit"
      @link = "section_edit"
      @section = Section.find(params[:id])
    elsif params[:admin] == "sections_import"
      @link = "sections_import"
    ##UNDERTAKINGS
    elsif params[:admin] == "undertakings"
      @link = "undertakings"
      @students = Undertaking.where(:status => true,:admin_status => true).all
    elsif params[:admin] == "pundertakings"
      @link = "pundertakings"
      # @students = Undertaking.where(:status => true,:admin_status => false).all
      @session = CoachingSession.where(:status => true).take.name
      @in_students = Undertaking.where(:status => true, :session => @session).take.tracking_id
      @students = Student.where.not(tracking_id: @in_students).where(:session => @session)
      
    elsif params[:admin] == "undertaking_text"
      @link = "undertaking_text"
      @utext = UndertakingText.find(1)
    elsif params[:admin] == "manage_undertakings"
      @link = "manage_undertakings"
      # @projects = Student.where(:tracking_id => params[:search])
      @active_session = CoachingSession.where(:status => true).take.name
      @studentsp = Undertaking.where(:status => true,:admin_status => false,:session => @active_session).all
      @students = Undertaking.where(:status => true,:admin_status => true,:session => @active_session).all
    ##FILES
    elsif params[:admin] == "view_file"
      # @file = Undertaking.where(:tracking_id => session[:id]).take
      @file = Undertaking.find_by(:tracking_id => params[:id])
      if (@file)
        send_data( @file.data , :type => @file.mime_type, :filename => "#{@file.file_name}", :disposition => "inline")
      else
        flash[:notice] = "No file uploaded yet."
      end
    elsif params[:admin] == "accept_file"
      @file = Undertaking.find_by(:tracking_id => params[:id])
      if (@file)
        @file.update(:admin_status => true)
        flash[:notice] = "File accepted"
      end
      redirect_to users_path(:admin => "manage_undertakings")
    elsif params[:admin] == "reject_file"
      @file = Undertaking.find_by(:tracking_id => params[:id])
      if (@file)
        @file.update(:admin_status => false)
        flash[:notice] = "File Rejected"
        @student = Student.find_by_tracking_id(@file.tracking_id)
        #AdminMailer.sample_email(@student).deliver
      else
        flash[:notice] = "File not found"
      end
      redirect_to users_path(:admin => "manage_undertakings")
    ##Associations
    elsif params[:admin] == "view_associations"
      @link = "view_associations"
    elsif params[:admin] == "add_associations"
      @link = "add_associations"
      @instructors = Instructor.all
       @sections = Section.all
    ##Other Views
    elsif params[:admin] == "hostel"
      @link = "hostel"   
      if params[:student]
        @student = params[:student]
      else @student =[]
      end
    elsif params[:admin] == "admin_attendance"
      @link = "admin_attendance"
    elsif params[:admin]=="settings"
      @link = "settings"
      @user = User.find(session[:id])
  
  
    elsif params[:admin] == "bankvoucher"
      @link = "bankvoucher"
      @bankdetail = Bankdetails.find(1)
    end
  
  
  
  end
  
  
  
  def coaching    ##for Coaching sessions Management
    @coaching_sessions = CoachingSession.all
    @current_session = CoachingSession.where(:status => true).take
  end

  def student_index
    @session_id = session[:id]
    if params[:std]=="student_profile"
      @link = "student_profile"
      @student=Student.find(session[:id])
    elsif params[:std] == "undertaking"
      @link = "undertaking"
      @session_id = session[:id]
      @student=Student.find(session[:id])
    elsif params[:std] == "upload"
      @link = "upload"
       @file = Undertaking.where(:tracking_id => session[:id]).take
      if (@file)
        @undertaking = "already_uploaded"
      else
       @undertaking = Undertaking.new
      end
    elsif params[:std] == "view_file"
      # @file = Undertaking.where(:tracking_id => session[:id]).take
      @file = Undertaking.find_by(:tracking_id => params[:id])
      if (@file)
        send_data( @file.data , :type => @file.mime_type, :filename => "#{@file.file_name}", :disposition => "inline")
      else
        flash[:notice] = "No file uploaded yet"
      end
    elsif params[:std]=="std_settings"
      @link = "std_settings"
      @student = Student.find(session[:id])
      # unauthorized! if cannot? :read, @instructor
      # @found3 = params[:found2]
      # @found3=Student.find(params[:found2])
    elsif params[:std] == "lms_view"
      @link = "lms_view"
      @student = Student.find(session[:id])
      @files = Lm.where(:section_id => @student.section)
    end
  end
  def instructor_index
    if params[:ins]=="instructor_profile"
      @link = "instructor_profile"
      @instructor=Instructor.find(session[:id])
    elsif params[:ins] == "attendance"
      @link = "attendance"
    elsif params[:ins] == "lms_view"
      @link = "lms_view"
      @lms = Lm.new
      @files = Lm.where(:instructor_id => session[:id])
    elsif params[:ins]=="ins_settings"
      @link = "ins_settings"
      @instructor = Instructor.find(session[:id])
    end
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
          if authorized_user
            flash[:notice] = "Welcome! You are LoggedIn"
            # cookies[:auth_token] = authorized_user.auth_token

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
    # cookies.delete(:auth_token)
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

  # private
  # def student_params
  #     params.permit( :tracking_id )
  # end