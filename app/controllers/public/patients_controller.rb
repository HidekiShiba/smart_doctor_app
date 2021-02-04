class Public::PatientsController < ApplicationController
  PER = 5

  def show
    @patient = current_patient
    @receptions = current_patient.receptions.where(examination_status: '発行済').order(created_at: :desc)
    @reservations = current_patient.reservations.where(examination_status: '受診前').order(created_at: :desc)
    # @examinations = current_patient.examinations.page(params[:page]).per(PER).order(created_at: :desc)
  end

  def edit
    @patient = current_patient
  end
  
  def update
    @patient = current_patient
    @patient.update(patient_params)
    redirect_to patient_path(current_patient)
  end
  
  def withdraw
    @patient = current_patient
    @patient.update(is_unsubscribe_flag: true)
    reset_session
    flash[:notice] = "退会が完了しました"
    redirect_to root_path
  end
  
  private
  def patient_params
    params.require(:patient).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, 
      :birth_date, :sex, :postal_code, :address, :tel, :email, :is_unsubscribe_flag
    )
  end
end
