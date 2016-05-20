class LmsController < ApplicationController
    def new
        @lms = Lm.new
    end
    def index
       @file = Lm.find_by(:id => params[:id])
      if (@file)
        send_data( @file.data , :type => @file.mime_type, :filename => "#{@file.file_name}", :disposition => "inline")
      else
        flash[:notice] = "No file uploaded yet"
      end 
    end

    def create
       @lms = Lm.new(set_params) do |t|
            t.instructor_id = session[:id]
            t.section_id = params[:lm][:section_id]
            @instructor = Instructor.find(session[:id])
            t.subject_name = @instructor.subject_name
            if params[:lm][:data]
                t.data      = params[:lm][:data].read
                t.file_name  = params[:lm][:data].original_filename
                t.mime_type = params[:lm][:data].content_type
            end
        end 
        if @lms.save
            flash[:notice]="file uploaded"
            redirect_to :controller => :users, :action => :instructor_index, :ins => "lms_view"
        end
    end
    def destroy
        @file = Lm.find(params[:id])
        if @file.present?
          @file.destroy
          flash[:notice] = "file destroyed successfully"
        end
        redirect_to(:controller => "users", :action => "instructor_index", :ins => "lms_view")
    end
    def set_params
        params.require(:lm).permit( :instructor_id, :section_id, :subject_name, :file_name, :data, :mime_type)
    end

end
