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
  
  def destroy
    @photo = Undertaking.find(params[:id])
    @undertaking.destroy
    redirect_to(photos_url)
  end
  private
  def set_params
    params.require(:undertaking).permit( :tracking_id, :status, :admin_status, :file_name, :data, :mime_type)
  end
end
