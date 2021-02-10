class Admin::PatientsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @patients = Patient.page(params[:page]).per(15)
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def edit
    @patient = Patient.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      redirect_to admin_patient_path(@patient.id), success: '患者情報を更新しました'
    else
      render :edit
    end
  end
  
  private
  def patient_params
    params.require(:patient).permit(
      :last_name, :first_name, :last_name_kana, :first_name_kana, 
      :birth_date, :sex, :postal_code, :address, :tel, :email, :is_unsubscribe_flag
    )
  end
end
