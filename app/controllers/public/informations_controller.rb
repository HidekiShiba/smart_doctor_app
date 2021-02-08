class Public::InformationsController < ApplicationController
  def index
    @informations = Information.page(params[:page]).per(10).order(created_at: :desc)
  end

  def show
    @information = Information.find(params[:id])
  end
end
