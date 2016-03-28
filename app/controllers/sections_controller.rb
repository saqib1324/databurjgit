class SectionsController < ApplicationController
    require "axlsx"

   def new
        @section = Section.new
   end
   def index
       @sections=Section.all
   end
    def import
      Section.import(params[:file])
      # redirect_to students_path, notice: "Students imported."
    end
  def export
      package = Axlsx::Package.new
      workbook = package.workbook
      workbook.add_worksheet(name: "Basic work sheet") do |sheet|
        sheet.add_row ["Section Id", "Section Name", "Instructor Id"]
        @sections=Section.all
        @sections.each do |st|
          sheet.add_row [st.section_id, st.section_name, st.instructor_id]
        end
      end
      send_data package.to_stream.read, :filename => "sections.xlsx"
  end


   def create
    @section = Section.new(section_params)
   # @section.id=Section_params[:tracking_id]
   # @instructor.save
    respond_to do |format|
      if @section.save
        format.html { redirect_to sections_path, notice: 'section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
     #   redirect_to new_section_path
        format.html { render :new }
        format.json {  render json: @section.errors, status: :unprocessable_entity }
      end
    end

   end
   def show
    @section=Section.find(params[:id])
   end
   def edit
     @section=Section.find(params[:id])
   end
   def update
      @section=Section.find(params[:id])
        respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to @section, notice: 'section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
   end
   def destroy
    @section=Section.find(params[:id])
              @section.destroy
    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'section was successfully destroyed.' }
      format.json { head :no_content }
    end

 
   end
   
   
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:section_id, :section_name, :instructor_id)
    end
  
  
  
    
end