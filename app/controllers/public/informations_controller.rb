class Public::InformationsController < ApplicationController
  def index
    @informations = Information.page(params[:page])
  end

  def show
    @information = Information.find(params[:id])
  end
end
