class HomeController < ApplicationController
  #before_action:forbid_login_user,{only:[:]}
  def index
    #session.clear
  end
  def transPersonal
  end

  def planHome
	redirect_to "/plans"
  end
end
