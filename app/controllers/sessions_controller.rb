class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to articles_path, notice: "ログインしました"
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: 'ログアウトしました'
  end

  def session_params
    params.require(:session).permit(:first_name, :email, :password)
  end
end
