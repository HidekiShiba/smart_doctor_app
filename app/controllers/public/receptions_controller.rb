class Public::ReceptionsController < ApplicationController
  before_action :authenticate_patient!
  def new
    @congestion = Congestion.find(1)
    @new_reception = Reception.new
    @new_reception.patient_id = current_patient.id
    @new_reception.congestion_id = 1
    @new_reception.number = @congestion.count + 1
    @new_reception.start_time = DateTime.current + Rational(1 * @congestion.time, 24 * 60)
  end
  
  def create
    @new_reception = Reception.new(reception_params)
    @congestion = Congestion.find(1)
    if @new_reception.save
      @congestion.update_attributes(count: @congestion.count + 1, time: @congestion.time + 20)
      redirect_to patient_path(current_patient.id), warning: '当日受付を完了しました。お気をつけてお越しください'
    else
      render :new
    end
  end
  
  private
  def reception_params
    params.require(:reception).permit(:patient_id, :congestion_id, :number, :start_time,:examination_status)
  end
end

