class Public::HomesController < ApplicationController
  def top
    @congestion = Congestion.find(1)
  end
  
  def about
    @congestion = Congestion.find(1)
    @reservation = Reservation.new
  end
end
