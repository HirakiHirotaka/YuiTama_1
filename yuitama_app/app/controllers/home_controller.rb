class HomeController < ApplicationController
  #before_action:forbid_login_user,{only:[:]}
  def index

  end
  def transPersonal
  end

  def planHome
	redirect_to "/plans"
  end
end
