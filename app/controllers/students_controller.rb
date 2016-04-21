class StudentsController < ApplicationController
    
# before_action :restrict_entry
  def import
    Student.import(params[:file])
    redirect_to users_path(:admin => "students_view"), notice: "Students imported."
  end
  def new
    @student = Student.new
    # redirect_to users_path(:admin => "students_view")
  end
  def index
    if params[:sort]
      @students=Student.order(params[:sort])
      redirect_to users_path(:admin => "students_view")
    else
      @students = Student.all
      redirect_to users_path(:admin => "students_view")
    end
  end
  def export
    package = Axlsx::Package.new
    workbook = package.workbook
    workbook.add_worksheet(name: "Basic work sheet") do |sheet|
      sheet.add_row ["name", "tracking_id", "father_name", "DOB", "SEX", "city","email","phone_number", "secondary_phone_number", "mailing_address", "username"]
      @students=Student.all
      @students.each do |st|
        sheet.add_row [st.name, st.tracking_id, st.father_name, st.DOB, st.SEX, st.city,st.email, st.phone_number, st.secondary_phone_number, st.mailing_address, st.username]
      end
    end
    send_data package.to_stream.read, :filename => "students.xlsx"
  end
  def create
    @student = Student.new(student_params)
    # @student.id=student_params[:tracking_id]
    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        # <%= link_to 'View Students', users_path(:admin => "students_view") %>
        format.html { redirect_to users_path(:admin => "students_view")}
        format.json { render :show, status: :created, location: @student }
      else
     #   redirect_to new_student_path
        format.html { render :new }
        format.json {  render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @student=Student.find(params[:id])
    respond_to do |format|
        format.html
        format.pdf do
            pdf=Prawn::Document.new
            pdf.text "Hello World"+@student.name
        
            send_data pdf.render, filename: "#{@student.name}.pdf", type: "application/pdf", disposition: "inline"
        end
    end
  end
  def edit
    @student=Student.find(params[:id])
  end
  def update
    @student=Student.find(params[:id])
      respond_to do |format|
        if @student.update(student_params)
          format.html { redirect_to users_path(:admin => "students_view"), notice: 'Student was successfully updated.' }
          format.json { render :show, status: :ok, location: @student }
        else
          format.html { render :edit }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      end
  end
  def destroy
    @student=Student.find(params[:id])
              @student.destroy
    respond_to do |format|
      # format.html { redirect_to students_url}
      format.html { redirect_to url_for(:controller => :users, :action => :index, :admin => "students_view") }
      
      flash[:notice] = 'Student was successfully destroyed.'
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit( :name, :tracking_id, :matric_percentage, :monthly_income, :SEX, :section,:city, :father_name, :DOB,  :email, :phone_number, :secondary_phone_number, :mailing_address, :username, :password)
    end
    def restrict_entry
      if $restrict == 'student' || $restrict == 'admin'
        return true
      else
        flash[:notice] = "You are not authorized to view this page"
        redirect_to :controller => 'users', :action => 'student_index' 
        return false
      end 
    end
end