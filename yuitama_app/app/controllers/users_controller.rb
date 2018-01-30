class UsersController < ApplicationController
  before_action:authenticate_user,{only:[:edit,:update,:index,:show]}
  before_action:forbid_login_user,{only:[:new,:create,:loginuser,:loginpost]}
  before_action:ensure_correct_user,{only:[:edit,:update]}


  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(name:params[:name],email:params[:email],password:params[:password])
    if @user.save then
      session[:pub_user_id] = @user.id
      flash[:notice] = "cpmlete your register"
      redirect_to "/users/#{@user.id}"
    else
      render("/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if @user.save then
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to "/users/#{@user.id}/"
    else
      render("/users/edit")
    end
  end


  def loginuser

  end

  def loginpost
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:pub_user_id] = @user.id
      flash[:notice] = "logged in!"
      redirect_to("/users/index")
    else
      @error_message = "Wrong your password or emailaddr"
      @email = params[:email]
      @password = params[:password]
      #render()は直接viewを指定する
      render("loginuser")
    end
  end

  def logoutuser
    session[:pub_user_id] = nil
    flash[:notice] = "logged out!"
    render("home/index")
  end

  def ensure_correct_user
    if @current_pub_user.id != params[:id].to_i
      flash[:notice] = "permission denied!!!"
      redirect_to("/users/index")
    end
  end

  def mypage

  end
end
