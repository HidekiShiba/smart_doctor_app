class Public::ReservationsController < ApplicationController
  def index
    @reservation = Reservation.new
    @reservations = Reservation.all
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.patient_id = current_patient.id
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.patient_id = current_patient.id
    if @reservation.save
      redirect_to patient_path(current_patient.id), warning: '予約を完了しました。お気をつけてお越しください'
    else
      render :confirm
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to patient_path(current_patient.id), warning: '予約内容を更新しました。お気をつけてお越しください'
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      redirect_to patient_path(current_patient.id), danger: '予約をキャンセルしました'
    else
      render :show
    end
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
