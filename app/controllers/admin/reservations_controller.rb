class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.page(params[:page]).order(created_at: :desc)
    # where(examination_status: '受診済')
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
    if @reservation.examination_status == "受診済"
       @examination = Examination.new
       @examination.reservation_id = @reservation.id
       @examination.save
    end
    redirect_to request.referer
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
