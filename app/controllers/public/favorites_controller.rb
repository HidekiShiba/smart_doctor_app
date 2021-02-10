class Public::FavoritesController < ApplicationController
  before_action :set_information
  def create
    information = Information.find(params[:information_id])
    favorite = current_patient.favorites.new(information_id: information.id)
    favorite.save
  end
  
  def destroy
    information = Information.find(params[:information_id])
    favorite = current_patient.favorites.find_by(information_id: information.id)
    favorite.destroy
  end
  
  private
  def set_information
    @information = Information.find(params[:information_id])
  end
end
