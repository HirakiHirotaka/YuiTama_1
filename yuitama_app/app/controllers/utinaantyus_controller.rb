class UtinaantyusController < ApplicationController
  before_action :set_utinaantyu, only: [:show, :edit, :update, :destroy]

  # GET /utinaantyus
  # GET /utinaantyus.json
  def index
    @utinaantyus = Utinaantyu.all
  end

  # GET /utinaantyus/1
  # GET /utinaantyus/1.json
  def show
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utinaantyu
      @utinaantyu = Utinaantyu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utinaantyu_params
      params.require(:utinaantyu).permit(:name, :age, :mailaddress)
    end
end
