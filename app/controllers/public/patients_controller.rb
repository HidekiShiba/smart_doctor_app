class Public::PatientsController < ApplicationController
  def show
    @patient = current_patient
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
