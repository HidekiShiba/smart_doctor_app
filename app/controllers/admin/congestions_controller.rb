class Admin::CongestionsController < ApplicationController
  def index
    @congestion = Congestion.find(1)
    @receptions = Reception.all.page(params[:page])
  end
  
  def update
    @congestion = Congestion.find(1)
    @congestion.update(congestion_params)
    redirect_to request.referer
  end
  
  def new
    @new_congestion = Congestion.new
  end
  
  def create
    @new_congestion = Congestion.new(congestion_params)
    @new_congestion.save
    redirect_to admin_congestions_path
  end
  
  private
  def congestion_params
    params.require(:congestion).permit(:count, :time)
  end
end
