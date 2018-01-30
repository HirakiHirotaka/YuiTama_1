class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  before_action:set_current_pub_user

  def set_current_pub_user
    @current_pub_user = User.find_by(id: session[:pub_user_id])
  end

  def authenticate_user
    if @current_pub_user == nil
      flash[:notice] = "You need logged in!!"
      redirect_to("/login_form")
    end
  end

  def forbid_login_user
    if @current_pub_user
      flash[:notice] = "you already logged in!!"
      redirect_to("/home/index")
    end
  end
end
