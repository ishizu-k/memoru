class CommentsController < ApplicationController
  def create
    @meeting_log = MeetingLog.find(params[:meeting_log_id])
    @comment = @meeting_log.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to meeting_log_path(@meeting_log), notice: '投稿できませんでした' }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:meeting_log_id, :content)
  end
end
