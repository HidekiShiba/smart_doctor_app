class Admin::ExaminationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @examinations = Examination.all.page(params[:page]).per(15).order(created_at: :desc)
  end

  def show
    @examination = Examination.find(params[:id])
  end

  def edit
    @examination = Examination.find(params[:id])
  end

  def update
    @examination = Examination.find(params[:id])
    @examination.update(examination_params)
    redirect_to admin_examinations_path, success: '受診履歴を更新しました'
  end

  private
  def examination_params
    params.require(:examination).permit(
      :examination_id, :reception_id, :diagnosis, :treatment,
      :prescription_status, :prescription_name, :update_status
    )
  end
end
