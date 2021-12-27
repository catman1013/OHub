class MypagesController < ApplicationController
  def show
    @articles = Article.where(user_id: current_user, status: params[:status])
  end
end