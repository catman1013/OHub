class MypagesController < ApplicationController
  def show
    if params[:status]
      @articles = Article.where(user_id: current_user, status: params[:status])
    else
      @articles = Article.where(user_id: current_user)
    end
  end
end