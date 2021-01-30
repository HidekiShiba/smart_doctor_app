class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Patient"
      @patients = Patient.looks(params[:search], params[:word])
    elsif @range == "Reservation"
      @reservations = Reservation.looks(params[:search], params[:word])
    elsif @range == "Reception"
      @receptions = Reception.looks(params[:search], params[:word])
    else
      @examinations = Examination.looks(params[:search], params[:word])
    end
  end
end
