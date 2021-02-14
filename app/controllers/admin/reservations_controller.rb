class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reservations = Reservation.all.page(params[:page]).per(15).order(created_at: :desc)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end
  
  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    @examinations = Examination.where(reservation_id: @reservation.id)
    if @examinations.count() > 0
       redirect_to request.referer, danger: '該当の受診履歴はすでに作成済です'
    elsif @reservation.examination_status == "受診済"
       @examination = Examination.new
       @examination.reservation_id = @reservation.id
       @examination.save
       redirect_to request.referer, warning: '受診情報を更新し、新規受診履歴を作成しました'
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to request.referer, danger: '予約を取り消しました'
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(
      :patient_id, :start_time, :end_time, :examination_count,
      :symptom, :body_parts, :starting_point, :treatment,
      :prescription, :side_effect, :other_diseases, :hospital_name,
      :pregnancy, :purpose, :request, :examination_status
    )
  end
end
