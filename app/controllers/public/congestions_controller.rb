class Public::CongestionsController < ApplicationController
  def index
    @congestion = Congestion.find(1)
    @reservation = Reservation.new
  end
end
