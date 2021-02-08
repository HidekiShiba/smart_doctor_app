class Public::HomesController < ApplicationController
  def top
    @congestion = Congestion.find(1)
  end
  
  def about
  end
end
