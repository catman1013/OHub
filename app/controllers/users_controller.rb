class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user), notice:"ユーザー#{@user.first_name}を登録しました。"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user=User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to user_path, notice:"ユーザー#{@user.first_name}を更新しました。"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :orien_started_at, :affilication, :university, :entered_university_at, :favorite_terrain, :favorite_event, :something_to_say, :achievement)
  end
end
