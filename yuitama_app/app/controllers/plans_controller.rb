class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]
  before_action :set_currentuser
  before_action :authenticate_user, only: [:edit, :update]
  before_action :ensure_currect_user, only: [:edit, :update, :destroy]


  # GET /plans
  # GET /plans.json
  def index()
    if params[:search]
      if params[:selected_val] == "内容"
        @plans = Plan.where(["content LIKE ?", "%#{params[:search]}%"]) #コンテント用
      elsif params[:selected_val] == "ハッシュタグ"
        @plans = Plan.where(["content LIKE ?", "%##{params[:search]}%"]) #ハッシュタグ用
      end
    else
      @plans = Plan.all
    end
    @counter = 0
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
      params.require(:plan).permit(:title, :content, :image)
    end

    def set_currentuser
      @currentuser = Utinaantyu.find_by(id: session[:user_id])
    end

    def authenticate_user
      if @currentuser == nil
        flash[:notice] = "ログインが必要です"
        redirect_to("/login")
      end
    end

    def ensure_currect_user
      if @currentuser.id != @plan.creator_id
        flash[:notice] = "権限がありません"
        redirect_to("/plans")
      end
    end

end
