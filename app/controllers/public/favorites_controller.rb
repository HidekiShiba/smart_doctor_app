class Public::FavoritesController < ApplicationController
  def create
    information = Information.find(params[:information_id])
    favorite = current_patient.favorites.new(information_id: information.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    information = Information.find(params[:information_id])
    favorite = current_patient.favorites.find_by(information_id: information.id)
    favorite.destroy
    redirect_to request.referer
  end
end
