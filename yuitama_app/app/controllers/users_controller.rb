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
    @user = User.new(user_params)
    if @user.save then
      session[:pub_user_id] = @user.id
      flash[:notice] = "cpmlete your register"
      redirect_to "/plans"
    else
      render("/users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params) then
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to "/users/#{@user.id}/mypage"
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
      session[:user_id] = nil#ウチナーンチュ垢はログアウト
      flash[:notice] = "logged in!"
      redirect_to("/plans")
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
    @user = User.find_by(id: params[:id])
      if @current_pub_user.bookedplan_id then
        num = @current_pub_user.bookedplan_id
        @plan = Plan.find(num)
        @plans = []#plans配列を作成 render partial collection を使いたいため配列にしたい
        @plans << @plan#plans配列に取ってきた@planを挿入
      end
  end
  private
  def user_params
      params.require(:user).permit(:name,:email,:password)
    end

end
