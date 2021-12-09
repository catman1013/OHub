class MypagesController < ApplicationController
  def show
    if params[:status]
      @articles = Article.where(user_id: current_user).search_by_article_status(params[:status])
    else
      @articles = Article.where(user_id: current_user)
    end
  end
end