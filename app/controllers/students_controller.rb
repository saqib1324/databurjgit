class StudentsController < ApplicationController
    

   def new
        @student = Student.new
   end
   def index
       @students=Student.all
   end
   def create
    @student = Student.new(student_params)
    @student.id=student_params[:tracking_id]
   # @instructor.save
    respond_to do |format|
      if @student.save
        format.html { redirect_to students_path, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end

   end
   def show
    
   end
   def edit
   end
   def update

        respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
   end
   def destroy
              @instructor.destroy
    respond_to do |format|
      format.html { redirect_to instructors_url, notice: 'Instructor was successfully destroyed.' }
      format.json { head :no_content }
    end

 
   end
   
   private
   
   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit( :name, :tracking_id, :father_name, :DOB, :SEX, :city, :email, :phone_number, :mailing_address)
    end
  
  
  
    
end