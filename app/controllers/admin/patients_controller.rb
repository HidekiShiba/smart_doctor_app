class Admin::PatientsController < ApplicationController
  def index
    @patients = Patient.page(params[:page])
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    redirect_to admin_patient_path(@patient.id)
  end
  
  private
  def patient_params
    params.require(:patient).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, 
      :birth_date, :sex, :postal_code, :address, :tel, :email, :is_unsubscribe_flag
    )
  end
end
