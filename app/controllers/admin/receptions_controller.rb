class Admin::ReceptionsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @receptions = Reception.all.page(params[:page])
  end

  def show
    @reception = Reception.find(params[:id])
  end
  
  def update
    @reception = Reception.find(params[:id])
    @reception.update(reception_params)
    if @reception.examination_status == "受診済"
       @examination = Examination.new
       @examination.reception_id = @reception.id
       @examination.save
    end
    redirect_to request.referer, warning: '受診情報を更新し、新規受診履歴を作成しました'
  end
  
  def destroy
    @reception = Reception.find(params[:id])
    @reception.destroy
    redirect_to request.referer, danger: '当日受付を削除しました'
  end
  
  private
  def reception_params
    params.require(:reception).permit(:patient_id, :congestion_id, :number, :start_time,:examination_status)
  end
end
