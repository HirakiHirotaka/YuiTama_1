class ProfileController < ApplicationController
  def create
    @profile = Utinaantyu.find(params[:utinaantyu_id]).profile.build(profile_params)
    #@comment.plan = Plan.find(params[:plan_id])
    respond_to do |format|
      if @profile.save
        format.html { redirect_to "/utinaantyu/#{params[:utinaantyu_id]}", notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { redirect_to "/utinaantyu/#{params[:utinaantyu_id]}" ,notice: "#{@profile.errors.full_messages}"}
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:introduction, :specialy)
  end

end
