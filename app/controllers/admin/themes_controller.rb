class Admin::ThemesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @new_theme = Theme.new
    @themes = Theme.all
  end
  
  def create
    @themes = Theme.all
    @new_theme = Theme.new(theme_params)
    if @new_theme.save
      redirect_to admin_themes_path, success: '新規テーマ作成しました'
    else
      render :index
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end
  
  def update
    @theme = Theme.find(params[:id])
    if @theme.update(theme_params)
      redirect_to admin_themes_path, success: 'テーマを更新しました'
    else
      render :edit
    end
  end
  
  private
  def theme_params
    params.require(:theme).permit(:name)
  end
end
