module SessionsHelper
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  def logged_in?
    !session[:user_id].nil?
  end
  def logout_current_user
    session[:user_id] = nil
  end
end
