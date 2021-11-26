class SessionsController < ApplicationController
  def new
    
  end
  def create
    user = User.find_by(email: session_params[:email])
    #authenticateは引数をハッシュ化した値とpassword_digestが一致するか否か
    #has_securepasswordで使えるようになる
    #ぼっち演算子userがnilだとしてもエラーが発生しないようにする
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to articles_path, notice: "ログインしました"
    else
      flash.now[:alert] = 'ログインに失敗しました'
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
