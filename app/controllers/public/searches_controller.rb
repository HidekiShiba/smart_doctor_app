class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Information"
      @word = params[:word]
      @informations = Information.looks(params[:search], params[:word])
    end
  end
end
