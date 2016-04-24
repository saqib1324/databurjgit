class UndertakingsController < ApplicationController
    
  def index
    @undertakings = Undertaking.all
  end

  def show
    @undertaking = Undertaking.where(:tracking_id => session[:id])
  end
  
  def new
    @undertaking = Undertaking.new
  end

  def create
    # build a photo and pass it into a block to set other attributes
    @undertaking = Undertaking.new(set_params) do |t|
      t.tracking_id = session[:id]
      if params[:undertaking][:data]
        
        t.data      = params[:undertaking][:data].read
        t.file_name  = params[:undertaking][:data].original_filename
        t.mime_type = params[:undertaking][:data].content_type
        t.admin_status = false
        t.status = true
      end
    end
    
    # normal save
    if @undertaking.save
      flash[:notice] = 'Photo was successfully Uploaded.'
      redirect_to(:controller => "users", :action => "student_index")
      
      else
      render :action => "new"
    end
  end
  def update
    @undertaking = Undertaking.where(:tracking_id => session[:id])
    if @undertaking.update(set_params)
      flash[:notice] = "New File Uploaded Successfully"
      redirect_to :controller => "users", :action => "student_index"
    end
  end
  def destroy
    @undertaking = Undertaking.where(:tracking_id => session[:id]).take
    if @undertaking.present?
      @undertaking.destroy
      flash[:notice] = "file destroyed successfully"
    end
    redirect_to(:controller => "users", :action => "student_index", :std => "upload")
  end
  private
  def set_params
    params.require(:undertaking).permit( :tracking_id, :status, :admin_status, :file_name, :data, :mime_type)
  end
end
