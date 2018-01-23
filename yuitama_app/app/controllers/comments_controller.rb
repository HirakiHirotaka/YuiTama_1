class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Plan.find(params[:plan_id]).comments.build(comment_params)
    #@comment.plan = Plan.find(params[:plan_id])
    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/plans/#{params[:plan_id]}", notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to "/plans/#{params[:plan_id]}" ,notice: "#{@comment.errors.full_messages}"}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
