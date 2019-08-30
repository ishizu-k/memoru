class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @meeting_log = MeetingLog.find(params[:meeting_log_id])
    @comment = @meeting_log.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to meeting_log_path(@meeting_log), alert: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js { render :edit }
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js { render :index }
      else
        format.html { redirect_to meeting_log_path(@meeting_log), alert: '編集できませんでした' }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:meeting_log_id, :content)
  end
end
