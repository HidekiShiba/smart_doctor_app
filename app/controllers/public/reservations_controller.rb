class Public::ReservationsController < ApplicationController
  def index
    @new_reservation = Reservation.new
    @reservations = Reservation.all
  end

  def new
    @new_reservation = Reservation.new
  end
  
  def create
    @new_reservation = Reservation.new(reservation_params)
    @new_reservation.patient_id = current_patient.id
    @new_reservation.save
    redirect_to reservation_path(@new_reservation.id)
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
  end
  
  def destroy
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
  
  def set_content
    @tmp = params[:content]
    render nothing: true
  end
end
