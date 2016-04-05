class InstructorsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # GET /instructors.json
  # before_action :restrict_entry
  
  require "axlsx"
  def index
    @instructors = Instructor.all
  end
  def export
      package = Axlsx::Package.new
      workbook = package.workbook
      workbook.add_worksheet(name: "Basic work sheet") do |sheet|
        sheet.add_row ["Instructor Id", "Instructor Name", "Email", "Subject Name", "Username"]
        @instructors=Instructor.all
        @instructors.each do |st|
          sheet.add_row [st.instructor_id, st.instructor_name, st.email, st.subject_name, st.username]
        end
      end
      send_data package.to_stream.read, :filename => "instructors.xlsx"
  end
  def show
      @instructor=Instructor.find(params[:id])
  end
  def new
    @instructor = Instructor.new
  end
  def edit
    @instructor=Instructor.find(params[:id])
  end
  def update
    @instructor=Instructor.find(params[:id])
    respond_to do |format|
      if @instructor.update(instructor_params)
        format.html { redirect_to users_path(admin: "instructors_view"), notice: 'Instructor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instructor }
      else
        format.html { render :edit }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end
  def delete
      @instructor=Instructor.find(params[:id])
  end
  def destroy
    @instructor=Instructor.find(params[:id])
    @instructor.destroy
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :users, :action => :index, :admin => "instructors_view"), notice: 'An Instructor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def create
    @instructor = Instructor.new(instructor_params)
    respond_to do |format|
      if @instructor.save
        format.html { redirect_to users_path(admin: "instructors_view"), notice: 'Instructor was successfully created.' }
        format.json { render :show, status: :created, location: @instructor }
      else
        format.html { render :new }
        format.json { render json: @instructor.errors, status: :unprocessable_entity }
      end
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instructor
      @instructor = Instructor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instructor_params
      params.require(:instructor).permit(:instructor_id, :phone_number, :instructor_name, :email, :subject_name, :username, :password )
    end
    
    def restrict_entry
      if $restrict == 'instructor' || $restrict == 'admin'
        return true
      else
        flash[:notice] = "You are not authorized to view this page"
        redirect_to :controller => 'users', :action => 'instructor_index'
        return false
      end 
    end
    
end

