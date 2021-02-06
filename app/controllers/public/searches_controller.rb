class Public::SearchesController < ApplicationController
  def search
    @model = params["search"]["model"]
    @content = params["search"]["content"]
    @datas = partical(@model, @content)
  end
  
  private
  def partical(model, content)
    if model == 'information'
      Information.where("subject LIKE ?", "%#{content}%").or(Information.where("body LIKE ?", "%#{content}%"))
    end
  end
end
