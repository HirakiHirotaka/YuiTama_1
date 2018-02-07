class UtinaantyusController < ApplicationController
  before_action :set_utinaantyu, only: [:show, :edit, :update, :destroy]
  #before_action :set_currentuser
  before_action :authenticate_user, only: [:edit, :update]
  before_action :forbid_login_user, only: [:login, :new, :create, :login_form]
  before_action :ensure_correct_user, only: [:edit, :update]

  # GET /utinaantyus
  # GET /utinaantyus.json
  def index
    @utinaantyus = Utinaantyu.all
  end

  # GET /utinaantyus/1
  # GET /utinaantyus/1.json
  def show
    @counter = 0
  end

  # GET /utinaantyus/new
  def new
    @utinaantyu = Utinaantyu.new
  end

  # GET /utinaantyus/1/edit
  def edit
  end

  # POST /utinaantyus
  # POST /utinaantyus.json
  def create
    @utinaantyu = Utinaantyu.new(utinaantyu_params)

    respond_to do |format|
      if @utinaantyu.save
        session[:user_id] = @utinaantyu.id
        format.html { redirect_to @utinaantyu, notice: 'Utinaantyu was successfully created.' }
        format.json { render :show, status: :created, location: @utinaantyu }
      else
        format.html { render :new }
        format.json { render json: @utinaantyu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utinaantyus/1
  # PATCH/PUT /utinaantyus/1.json
  def update
    @utinaantyu = Utinaantyu.find(params[:id])
    respond_to do |format|
      if @utinaantyu.update(utinaantyu_params)
        format.html { redirect_to @utinaantyu, notice: 'Utinaantyu was successfully updated.' }
        format.json { render :show, status: :ok, location: @utinaantyu }
      else
        format.html { render :edit }
        format.json { render json: @utinaantyu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utinaantyus/1
  # DELETE /utinaantyus/1.json
  def destroy
    @utinaantyu.destroy
    respond_to do |format|
      format.html { redirect_to utinaantyus_url, notice: 'Utinaantyu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def login
    @utinaantyu = Utinaantyu.find_by(mailaddress: params[:mailaddress],password: params[:password])
    if @utinaantyu
      session[:user_id] = @utinaantyu.id
      session[:pub_user_id] = nil #旅行者垢はログアウト
      flash[:notice] ="#{@utinaantyu.name}さんがログインしました。"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています。"
      render("/utinaantyus/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice]="ログアウトしました。"
    redirect_to("/utinaantyus/login")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utinaantyu
      @utinaantyu = Utinaantyu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utinaantyu_params
      params.require(:utinaantyu).permit(:name, :age, :mailaddress, :password)
    end

    def set_currentuser
      @current_utinaantyu = Utinaantyu.find_by(id: session[:user_id])
    end

    def authenticate_user
      if @current_utinaantyu == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/utinaantyus/login")
      end
    end

    def forbid_login_user
      if @current_utinaantyu
        flash[:notice] = "すでにログインしています"
        redirect_to("/plans")
      end
    end

    def ensure_correct_user
      if @current_utinaantyu == params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/plans")
      end
    end
end
