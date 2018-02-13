class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :set_currentuser
  before_action :authenticate_user, only: [:new, :edit, :update]
  before_action :ensure_currect_user, only: [:edit, :update, :destroy]


  # GET /plans
  # GET /plans.json
  def index()
    @counter = 0
    searchword = params[:search]
    searchgenre = params[:selected_val]

    if searchword
      if searchgenre == "内容"
        @plans = Plan.where(["content LIKE ?", "%#{searchword}%"]) #コンテント用
      elsif searchgenre == "ハッシュタグ"
        @plans = Plan.where(["content LIKE ?", "%##{searchword}%"]) #ハッシュタグ用
      end
      render
    else
      @plans = Plan.all
    end
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
    @comment = @plan.comments.new
    @comments = @plan.comments
  end

  def show_image
	@plan = Plan.find(params[:id])
	send_data @plan.image, :type => 'image/jpeg', :disposition => 'inline'
  end


  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
	image = plan_params[:image]
	plan = {}
  plan = plan_params
	plan[:creator_id] = session[:user_id]
	if image != nil
	  plan[:image] = image.read
	else
    plan[:image] = File.open("#{Rails.root.to_s}/app/assets/images/no_image.png","r").read
	end
    @plan = Plan.new(plan)
    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    plan = {}
    plan = plan_params
    plan[:creator_id] = @plan.creator_id
    if plan[:image] == nil
      plan[:image] = File.open("#{Rails.root.to_s}/app/assets/images/no_image.png","r").read
    end

    respond_to do |format|
      if @plan.update(plan)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def book
      if @current_pub_user then
        @plan = Plan.find(params[:id])
        @user = User.find_by(id: @current_pub_user.id)
        @user.bookedplan_id = @plan.id
        @user.save
        redirect_to "/users/#{@user.id}/mypage"
      else
        flash[:notice] = "You should need logged in !!"
      end
    end

    def cansel
      if @current_pub_user then
        @plan = Plan.find(params[:plan_id])
        @user = User.find_by(id: @current_pub_user.id)
        @user.bookedplan_id = nil
        @user.save
        redirect_to "/users/#{@user.id}/mypage"
      else
        flash[:notice] = "You should need logged in !!"
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:title, :content, :image, :scheduled_date)
    end

    def set_currentuser
      @currentuser = Utinaantyu.find_by(id: session[:user_id])
    end

    def authenticate_user
      if @currentuser == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/utinaantyus/login")
      end
    end

    def ensure_currect_user
      if @currentuser.id != @plan.creator_id
        flash[:notice] = "権限がありません"
        redirect_to("/plans")
      end
    end

end
