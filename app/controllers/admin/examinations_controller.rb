class Admin::ExaminationsController < ApplicationController
  def index
    @examinations = Examination.all.page(params[:page])
  end

  def new
  end

  def show
  end

  def edit
  end
end
