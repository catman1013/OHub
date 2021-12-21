class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :root_to_articles_path, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user), notice: "ユーザー#{@user.first_name}を登録しました。"
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def index
    @users = User.all
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー#{@user.first_name}を更新しました。"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :orien_started_at, :affilication, :university, :entered_university_at, :favorite_terrain, :favorite_event, :something_to_say, :achievement)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    unless current_user.id == @user.id
      redirect_to root_path, notice: 'はじいたうほ'
    end
  end

  def root_to_articles_path
    if current_user
      redirect_to articles_path
    end
  end
end
