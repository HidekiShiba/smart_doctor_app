class Admin::CongestionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    today_start = Time.now.strftime("%Y-%m-%d") + " 00:00:00"
    today_end = Time.now.strftime("%Y-%m-%d") + " 23:59:59"
    @congestion = Congestion.find(1)
    @receptions = Reception.where("examination_status = ? and start_time >= ? and start_time <= ?", 0, today_start, today_end).page(params[:page]).order(created_at: :desc)
    @reservations = Reservation.where("examination_status = ? and start_time >= ? and start_time <= ?", 0, today_start, today_end).page(params[:page]).order(created_at: :desc)
  end

  def update
    @congestion = Congestion.find(1)
    @congestion.update(congestion_params)
    redirect_to request.referer, success: '混雑状況を更新しました'
  end

  def new
    @new_congestion = Congestion.new
  end

  def create
    @new_congestion = Congestion.new(congestion_params)
    @new_congestion.save
    redirect_to admin_congestions_path, success: '混雑状況を作成しました'
  end

  private
  def congestion_params
    params.require(:congestion).permit(:count, :time)
  end
end
