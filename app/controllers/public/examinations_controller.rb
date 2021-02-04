class Public::ExaminationsController < ApplicationController
  def index
  end

  def show
    @examination = Examination.find(params[:id])
  end
end
