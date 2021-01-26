class Admin::ThemesController < ApplicationController
  def index
    @new_theme = Theme.new
    @themes = Theme.all
  end
  
  def create
    @new_theme = Theme.new(theme_params)
    @new_theme.save
    redirect_to admin_themes_path
  end

  def edit
    @theme = Theme.find(params[:id])
  end
  
  def update
    @theme = Theme.find(params[:id])
    @theme.update(theme_params)
    redirect_to admin_themes_path
  end
  
  private
  def theme_params
    params.require(:theme).permit(:name)
  end
end
