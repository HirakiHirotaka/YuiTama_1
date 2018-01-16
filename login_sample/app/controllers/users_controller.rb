class UsersController < ApplicationController
  before_action :authenticate_user,{only:[:edit,:update,:index,:show]}
  before_action :forbid_login_user, {only: [:new,:create,:login_form,:login]}
  before_action :ensure_correct_user,{only:[:edit,:update]}

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
    if @user.save
      session[:user_id] = user.id
    end
  end

  def create
    @user = User.new(name: params[:name],email: params[:email],image_name:"default_egashira.jpg",password: params[:password])
    if @user.save then
      flash[:notice] = "your register success."
      redirect_to("/users/#{@user.id}")
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
      flash[:notice] = "edited"
      redirect_to "/users/#{@user.id}/"
    else
      render("/users/edit")
    end
  end

  def login_form

  end

  def login
    @user = User.find_by(email: params[:email],password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "logged inn , Welcome!"
      redirect_to("/users/index")
    else
      @error_message = "Wrong emailaddress or Password!!"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
      end
  end

  def logout
      session[:user_id] = nil
      flash[:notice] = "logged out , see you later!"
      redirect_to("/login")
  end

  def ensure_corrent_user
    if @current_user != params[:id].to_i
      flash[:notice] = "permission denied!!"
      redirect_to("/users/index")
    end
  end

end
