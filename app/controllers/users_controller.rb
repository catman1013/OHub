class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
   
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user),notice:"ユーザー#{@user.first_name}を登録しました。"
    else
      #binding.pry
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
    #binding.pry
    if @user.update(user_params)
      redirect_to articles_path, notice:"ユーザー#{@user.first_name}を更新しました。"
    else
      flash[:notice] = "未記入の項目があるうほ"
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
