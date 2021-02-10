class Admin::SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @datas = partical(@model, @content)
  end
  
  private
  def partical(model, content)
    if model == 'patient'
      Patient.where("last_name_kana LIKE ?", "%#{content}%")
    elsif model == 'reservation'
      Reservation.where("start_time LIKE ?", "%#{content}%")
    elsif model == 'reception'
      Reception.where("start_time LIKE ?", "%#{content}%")
    elsif model == 'examination'
      Examination.where("created_at LIKE ?", "%#{content}%")  
    end
  end
end
