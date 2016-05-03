class AssociationController < ApplicationController
  def index
    @associations = Association.all
  end
  def new
    @association = Association.new
  end

  def create
    # flash[:notice] = "Yayyyy"
    redirect_to :root
  end
  def edit

  end

  def update
  end

  def destroy
  end
end
