class Admin::InformationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @informations = Information.all.page(params[:page]).per(10).order(created_at: :desc)
  end

  def new
    @new_information = Information.new
    @themes = Theme.all
  end
  
  def create
    @themes = Theme.all
    @new_information = Information.new(information_params)
    if @new_information.save
      redirect_to admin_informations_path, success: '新規のお知らせを投稿しました'
    else
      render :new
    end
  end

  def show
    @information = Information.find(params[:id])
  end

  def edit
    @information = Information.find(params[:id])
    @themes = Theme.all
  end
  
  def update
    @themes = Theme.all
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to admin_informations_path, success: 'お知らせの内容を更新しました'
    else
      render :edit
    end
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
