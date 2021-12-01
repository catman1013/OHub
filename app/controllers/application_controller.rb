class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :writer_or_not

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def writer_or_not(argument)
    current_user && argument.user_id == current_user.id
  end
end
