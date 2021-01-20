class Admin::InformationsController < ApplicationController
  def index
    @informations = Information.page(params[:page])
  end

  def new
    @new_information = Information.new
    @themes = Theme.all
  end
  
  def create
    @new_information = Information.new(information_params)
    @new_information.save
    redirect_to admin_information_path(@new_information.id)
  end

  def show
    @information = Information.find(params[:id])
  end

  def edit
    @information = Information.find(params[:id])
    @themes = Theme.all
  end
  
  def update
    @information = Information.find(params[:id])
    @information.update(information_params)
    redirect_to admin_information_path(@information.id)
  end
  
  def destroy
    
  end
  
  private
  def information_params
    params.require(:information).permit(
      :theme_id, :subject, :image, :body
    )
  end
end
